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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_83b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_10ae]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1556_c2_f497]
signal t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_f497]
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1557_c3_a50e[uxn_opcodes_h_l1557_c3_a50e]
signal printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_c4ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_4c7b]
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_37b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_b2f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1570_c3_51d9]
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_1588]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_9c32]
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_96bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1578_c7_930b]
signal t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_930b]
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1579_c3_045d]
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_1e48]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_ee48]
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1584_c32_0543]
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1584_c32_4658]
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1584_c32_92ce]
signal MUX_uxn_opcodes_h_l1584_c32_92ce_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_92ce_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_307b]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_bc30]
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_6b0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_58a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_22cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_d47b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_d47b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_d47b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_d47b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_d47b]
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1600_c34_e614]
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_0d90]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_6371]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_6371]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_6371]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9a35( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1556_c2_f497
t16_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

-- printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e
printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e : entity work.printf_uxn_opcodes_h_l1557_c3_a50e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output);

-- t16_MUX_uxn_opcodes_h_l1564_c7_4c7b
t16_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1568_c7_b2f8
t16_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9
CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x,
CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output);

-- t16_MUX_uxn_opcodes_h_l1574_c7_9c32
t16_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output);

-- t16_MUX_uxn_opcodes_h_l1578_c7_930b
t16_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d
BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543
BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output);

-- MUX_uxn_opcodes_h_l1584_c32_92ce
MUX_uxn_opcodes_h_l1584_c32_92ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1584_c32_92ce_cond,
MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue,
MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse,
MUX_uxn_opcodes_h_l1584_c32_92ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1600_c34_e614
CONST_SR_8_uxn_opcodes_h_l1600_c34_e614 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x,
CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output,
 t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output,
 t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output,
 t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output,
 CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output,
 t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output,
 t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output,
 MUX_uxn_opcodes_h_l1584_c32_92ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_5389 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_7799 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_93c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_5c75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_930b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_c0be : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_ff6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_171c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_08ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_1e5e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_bda3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1552_l1608_DUPLICATE_83c5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_c0be := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_c0be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_08ea := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_08ea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_ff6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_ff6a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_93c0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_93c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_5c75 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_5c75;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_5389 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_5389;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_7799 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_7799;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse := resize(to_signed(-2, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1595_c24_171c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_171c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_307b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_0d90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_c4ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_930b_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1584_c32_0543] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_left;
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output := BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_1e48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_83b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_37b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1600_c34_e614] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output := CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_22cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_1588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_bda3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_bda3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_96bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_6b0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_0543_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_83b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_c4ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_37b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_1588_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_96bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_1e48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_307b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_22cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_0d90_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_bda3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_bda3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_171c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_26ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_45c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_04a1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_379e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_eaf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_d6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_b8fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_930b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1584_c32_4658] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_left;
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output := BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_10ae] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1579_c3_045d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_left;
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output := BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1600_c24_1e5e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_1e5e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_e614_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1570_c3_51d9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output := CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_6371] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_d47b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_6371] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_6371] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_4658_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_045d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_1e5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_51d9_return_output;
     VAR_printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_10ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- printf_uxn_opcodes_h_l1557_c3_a50e[uxn_opcodes_h_l1557_c3_a50e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1557_c3_a50e_uxn_opcodes_h_l1557_c3_a50e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_d47b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;

     -- MUX[uxn_opcodes_h_l1584_c32_92ce] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1584_c32_92ce_cond <= VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_cond;
     MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue <= VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iftrue;
     MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse <= VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_return_output := MUX_uxn_opcodes_h_l1584_c32_92ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_d47b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_d47b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_d47b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue := VAR_MUX_uxn_opcodes_h_l1584_c32_92ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_d47b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- t16_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_58a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_58a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- t16_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_bc30] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_bc30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_ee48] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;

     -- t16_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_ee48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_930b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_930b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_9c32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_9c32_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_b2f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_b2f8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_4c7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4c7b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_f497] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1552_l1608_DUPLICATE_83c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1552_l1608_DUPLICATE_83c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9a35(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_f497_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_f497_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1552_l1608_DUPLICATE_83c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1552_l1608_DUPLICATE_83c5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
