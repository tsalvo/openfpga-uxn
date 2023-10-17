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
-- Submodules: 74
entity lda_0CLK_05e131b1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_05e131b1;
architecture arch of lda_0CLK_05e131b1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1474_c6_595c]
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1474_c1_1c98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1474_c2_c2ba]
signal t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1475_c3_5218[uxn_opcodes_h_l1475_c3_5218]
signal printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1479_c11_da1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1479_c7_fa63]
signal t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_6461]
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1482_c7_b1f4]
signal t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1484_c3_4d4b]
signal CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_4d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1487_c7_d21e]
signal t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_44e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1490_c7_5878]
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_5878]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1490_c7_5878]
signal t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1491_c3_fecb]
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1493_c30_7106]
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_ceda]
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_93f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_ef02]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1500_c7_97bd]
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_97bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_97bd]
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_97bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_97bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_c1b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_9625]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_9625]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9969( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left,
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right,
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba
tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1474_c2_c2ba
t16_MUX_uxn_opcodes_h_l1474_c2_c2ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond,
t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue,
t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse,
t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

-- printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218
printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218 : entity work.printf_uxn_opcodes_h_l1475_c3_5218_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63
tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- t16_MUX_uxn_opcodes_h_l1479_c7_fa63
t16_MUX_uxn_opcodes_h_l1479_c7_fa63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond,
t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue,
t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse,
t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4
tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- t16_MUX_uxn_opcodes_h_l1482_c7_b1f4
t16_MUX_uxn_opcodes_h_l1482_c7_b1f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond,
t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue,
t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse,
t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b
CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x,
CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e
tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- t16_MUX_uxn_opcodes_h_l1487_c7_d21e
t16_MUX_uxn_opcodes_h_l1487_c7_d21e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond,
t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue,
t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse,
t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1490_c7_5878
tmp8_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- t16_MUX_uxn_opcodes_h_l1490_c7_5878
t16_MUX_uxn_opcodes_h_l1490_c7_5878 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond,
t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue,
t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse,
t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb
BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left,
BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right,
BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1493_c30_7106
sp_relative_shift_uxn_opcodes_h_l1493_c30_7106 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins,
sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x,
sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y,
sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8
tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd
tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond,
tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue,
tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse,
tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output,
 tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output,
 tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output,
 CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output,
 sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output,
 tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output,
 tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_3169 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_404a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_5212 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_6095 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_8375 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1483_l1491_DUPLICATE_17b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1511_l1469_DUPLICATE_d390_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_8375 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_8375;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_3169 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_3169;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_404a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_404a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_5212 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_5212;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_6095 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_6095;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y := resize(to_signed(-1, 2), 4);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse := tmp8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_6461] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_left;
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output := BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_ceda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1483_l1491_DUPLICATE_17b6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1483_l1491_DUPLICATE_17b6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_ef02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_44e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_4d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1474_c6_595c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_c1b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1479_c11_da1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1493_c30_7106] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_ins;
     sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_x;
     sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output := sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_595c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_da1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_44e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_ceda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_ef02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c1b5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1483_l1491_DUPLICATE_17b6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1483_l1491_DUPLICATE_17b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_e5c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_7607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1500_l1496_DUPLICATE_8fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1482_l1479_l1474_l1496_DUPLICATE_9602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1506_l1474_l1496_DUPLICATE_ff44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_bc32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_l1500_l1496_DUPLICATE_1298_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_7106_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1484_c3_4d4b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output := CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_97bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_9625] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1491_c3_fecb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_left;
     BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output := BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1474_c1_1c98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1500_c7_97bd] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_cond;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output := tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_97bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_9625] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_fecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_4d4b_return_output;
     VAR_printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_1c98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_9625_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_9625_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_97bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_97bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- printf_uxn_opcodes_h_l1475_c3_5218[uxn_opcodes_h_l1475_c3_5218] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1475_c3_5218_uxn_opcodes_h_l1475_c3_5218_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_97bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_93f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_93f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     -- t16_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_5878] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_5878_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- t16_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_d21e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_d21e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_b1f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- t16_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_b1f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c7_fa63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_fa63_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c2_c2ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1511_l1469_DUPLICATE_d390 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1511_l1469_DUPLICATE_d390_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9969(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_c2ba_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1511_l1469_DUPLICATE_d390_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1511_l1469_DUPLICATE_d390_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
