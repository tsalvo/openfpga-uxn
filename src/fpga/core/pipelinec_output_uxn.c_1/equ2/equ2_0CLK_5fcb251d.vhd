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
-- Submodules: 108
entity equ2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_5fcb251d;
architecture arch of equ2_0CLK_5fcb251d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l950_c6_3749]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_9c72]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l950_c2_4f35]
signal n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l950_c2_4f35]
signal t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_4f35]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l951_c3_3be0[uxn_opcodes_h_l951_c3_3be0]
signal printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l958_c11_5b2c]
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l958_c7_8b14]
signal n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l958_c7_8b14]
signal t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_8b14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_e365]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_f9f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_b56f]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_694f]
signal n16_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l968_c7_694f]
signal t16_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_694f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_cecb]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_1bd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l973_c3_05e8]
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_b4f1]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_c05f]
signal n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_c05f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_e724]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l981_c7_7df8]
signal n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_7df8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_5e99]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l987_c7_1471]
signal n16_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_1471]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_10bd]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_99a7]
signal n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_99a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l992_c3_54a3]
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l995_c32_6891]
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l995_c32_bdfb]
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l995_c32_ee98]
signal MUX_uxn_opcodes_h_l995_c32_ee98_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_ee98_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_ee98_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l995_c32_ee98_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l997_c11_90c8]
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l997_c7_4693]
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_4693]
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_4693]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_4693]
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_4693]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_a1b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1001_c24_328c]
signal MUX_uxn_opcodes_h_l1001_c24_328c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_328c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_328c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1001_c24_328c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_2d7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_c846]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_c846]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749
BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output);

-- n16_MUX_uxn_opcodes_h_l950_c2_4f35
n16_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- t16_MUX_uxn_opcodes_h_l950_c2_4f35
t16_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35
result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

-- printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0
printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0 : entity work.printf_uxn_opcodes_h_l951_c3_3be0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c
BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right,
BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output);

-- n16_MUX_uxn_opcodes_h_l958_c7_8b14
n16_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- t16_MUX_uxn_opcodes_h_l958_c7_8b14
t16_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14
result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365
BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_f9f9
n16_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c7_f9f9
t16_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9
result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f
BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_694f
n16_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_694f_cond,
n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- t16_MUX_uxn_opcodes_h_l968_c7_694f
t16_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l968_c7_694f_cond,
t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f
result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb
BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output);

-- n16_MUX_uxn_opcodes_h_l972_c7_1bd6
n16_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- t16_MUX_uxn_opcodes_h_l972_c7_1bd6
t16_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6
result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8
BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left,
BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right,
BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_c05f
n16_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f
result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724
BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output);

-- n16_MUX_uxn_opcodes_h_l981_c7_7df8
n16_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8
result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output);

-- n16_MUX_uxn_opcodes_h_l987_c7_1471
n16_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l987_c7_1471_cond,
n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471
result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd
BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_99a7
n16_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7
result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3
BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left,
BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right,
BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l995_c32_6891
BIN_OP_AND_uxn_opcodes_h_l995_c32_6891 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left,
BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right,
BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb
BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left,
BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right,
BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output);

-- MUX_uxn_opcodes_h_l995_c32_ee98
MUX_uxn_opcodes_h_l995_c32_ee98 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l995_c32_ee98_cond,
MUX_uxn_opcodes_h_l995_c32_ee98_iftrue,
MUX_uxn_opcodes_h_l995_c32_ee98_iffalse,
MUX_uxn_opcodes_h_l995_c32_ee98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8
BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output);

-- MUX_uxn_opcodes_h_l1001_c24_328c
MUX_uxn_opcodes_h_l1001_c24_328c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1001_c24_328c_cond,
MUX_uxn_opcodes_h_l1001_c24_328c_iftrue,
MUX_uxn_opcodes_h_l1001_c24_328c_iffalse,
MUX_uxn_opcodes_h_l1001_c24_328c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output,
 n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output,
 n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output,
 n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output,
 n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output,
 n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output,
 BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output,
 MUX_uxn_opcodes_h_l995_c32_ee98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output,
 MUX_uxn_opcodes_h_l1001_c24_328c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_f484 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_a99f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_2d6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_edbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_abcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_6a08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_9a1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_b09b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_ee98_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l995_c32_ee98_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e7fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_328c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1001_c24_328c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_8053_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1008_l946_DUPLICATE_ca26_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_edbc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_edbc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_f484 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_f484;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_2d6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_2d6a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_9a1d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_9a1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_a99f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_a99f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_6a08 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_6a08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e7fb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_e7fb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_b09b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_b09b;
     VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_abcb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_abcb;
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iffalse := resize(to_signed(-3, 3), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_e724] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l997_c11_90c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_b4f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l958_c11_5b2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_cecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c24_a1b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_4f35_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_5e99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_99a7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_8053 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_8053_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l995_c32_6891] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_left;
     BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output := BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c6_3749] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_2d7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_b56f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_10bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_e365] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l995_c32_6891_return_output;
     VAR_MUX_uxn_opcodes_h_l1001_c24_328c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c24_a1b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_2d7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c6_3749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l958_c11_5b2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_e365_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_b56f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_cecb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_b4f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_e724_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5e99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_10bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_90c8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l973_l963_l992_DUPLICATE_8168_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l950_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_6877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1003_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_f9ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l950_l997_l987_l981_l977_l968_l972_l962_l958_DUPLICATE_5687_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1003_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_4473_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_8053_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l991_l997_DUPLICATE_8053_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l950_l997_l987_l991_l981_l977_l968_l972_l962_l958_DUPLICATE_5086_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l950_c2_4f35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l991_c7_99a7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_4693] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l995_c32_bdfb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_left;
     BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output := BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_c846] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l992_c3_54a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_left;
     BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output := BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_4693] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l950_c1_9c72] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output;

     -- MUX[uxn_opcodes_h_l1001_c24_328c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1001_c24_328c_cond <= VAR_MUX_uxn_opcodes_h_l1001_c24_328c_cond;
     MUX_uxn_opcodes_h_l1001_c24_328c_iftrue <= VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iftrue;
     MUX_uxn_opcodes_h_l1001_c24_328c_iffalse <= VAR_MUX_uxn_opcodes_h_l1001_c24_328c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1001_c24_328c_return_output := MUX_uxn_opcodes_h_l1001_c24_328c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_c846] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l973_c3_05e8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_left;
     BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output := BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l995_c32_ee98_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l995_c32_bdfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l973_c3_05e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l992_c3_54a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l964_DUPLICATE_19e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue := VAR_MUX_uxn_opcodes_h_l1001_c24_328c_return_output;
     VAR_printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l950_c1_9c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_c846_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4693_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_c846_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4693_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- printf_uxn_opcodes_h_l951_c3_3be0[uxn_opcodes_h_l951_c3_3be0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l951_c3_3be0_uxn_opcodes_h_l951_c3_3be0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l997_c7_4693] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_cond;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output := result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_4693] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output;

     -- t16_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- MUX[uxn_opcodes_h_l995_c32_ee98] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l995_c32_ee98_cond <= VAR_MUX_uxn_opcodes_h_l995_c32_ee98_cond;
     MUX_uxn_opcodes_h_l995_c32_ee98_iftrue <= VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iftrue;
     MUX_uxn_opcodes_h_l995_c32_ee98_iffalse <= VAR_MUX_uxn_opcodes_h_l995_c32_ee98_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l995_c32_ee98_return_output := MUX_uxn_opcodes_h_l995_c32_ee98_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_4693] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue := VAR_MUX_uxn_opcodes_h_l995_c32_ee98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4693_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4693_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output := t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- n16_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output := n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_99a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c7_99a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- n16_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l987_c7_1471] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_cond;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output := result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l987_c7_1471_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_t16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- t16_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_7df8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l981_c7_7df8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_t16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- n16_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- t16_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_c05f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_c05f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;
     -- n16_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output := n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l972_c7_1bd6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output := result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l972_c7_1bd6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_694f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l968_c7_694f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- n16_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_f9f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_f9f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- n16_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l958_c7_8b14] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_cond;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output := result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l958_c7_8b14_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c2_4f35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1008_l946_DUPLICATE_ca26 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1008_l946_DUPLICATE_ca26_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c2_4f35_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l950_c2_4f35_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1008_l946_DUPLICATE_ca26_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1008_l946_DUPLICATE_ca26_return_output;
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
