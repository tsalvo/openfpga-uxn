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
-- BIN_OP_EQ[uxn_opcodes_h_l1474_c6_14da]
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1474_c1_5826]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1474_c2_877e]
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1474_c2_877e]
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1474_c2_877e]
signal t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1475_c3_52a8[uxn_opcodes_h_l1475_c3_52a8]
signal printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1479_c11_595b]
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1479_c7_0557]
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1479_c7_0557]
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1479_c7_0557]
signal t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_e07d]
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1482_c7_8b9f]
signal t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1484_c3_d9de]
signal CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_4d20]
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1487_c7_7fd4]
signal t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_1bbf]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_6353]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1490_c7_6353]
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1490_c7_6353]
signal t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1491_c3_ea50]
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1493_c30_2c84]
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_4b8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1496_c7_ae0d]
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_d62c]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_adf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_adf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_adf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_adf0]
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1500_c7_adf0]
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_7f6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_5b5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_5b5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a88( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left,
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right,
BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1474_c2_877e
tmp8_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- t16_MUX_uxn_opcodes_h_l1474_c2_877e
t16_MUX_uxn_opcodes_h_l1474_c2_877e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond,
t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue,
t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse,
t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

-- printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8
printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8 : entity work.printf_uxn_opcodes_h_l1475_c3_52a8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left,
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right,
BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1479_c7_0557
tmp8_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- t16_MUX_uxn_opcodes_h_l1479_c7_0557
t16_MUX_uxn_opcodes_h_l1479_c7_0557 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond,
t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue,
t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse,
t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f
tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- t16_MUX_uxn_opcodes_h_l1482_c7_8b9f
t16_MUX_uxn_opcodes_h_l1482_c7_8b9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond,
t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue,
t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse,
t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de
CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x,
CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4
tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- t16_MUX_uxn_opcodes_h_l1487_c7_7fd4
t16_MUX_uxn_opcodes_h_l1487_c7_7fd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond,
t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue,
t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse,
t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1490_c7_6353
tmp8_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- t16_MUX_uxn_opcodes_h_l1490_c7_6353
t16_MUX_uxn_opcodes_h_l1490_c7_6353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond,
t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue,
t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse,
t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50
BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left,
BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right,
BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84
sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins,
sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x,
sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y,
sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d
tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond,
tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0
tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond,
tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output,
 sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_9318 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_850e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_961c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_098e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_0564 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1491_l1483_DUPLICATE_9101_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1511_l1469_DUPLICATE_c3cc_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_9318 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1476_c3_9318;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_0564 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_0564;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_961c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_961c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_098e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_098e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_850e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1480_c3_850e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_1bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_7f6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1493_c30_2c84] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_ins;
     sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_x;
     sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output := sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_4b8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1474_c6_14da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_4d20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_e07d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_d62c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1479_c11_595b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1491_l1483_DUPLICATE_9101 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1491_l1483_DUPLICATE_9101_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1474_c6_14da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c11_595b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_e07d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_4d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_1bbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_4b8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_d62c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_7f6d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1491_l1483_DUPLICATE_9101_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1491_l1483_DUPLICATE_9101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1487_l1482_l1479_l1474_DUPLICATE_864e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_87c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1500_l1490_l1496_l1487_l1482_l1479_DUPLICATE_5230_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c4ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_c136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_l1490_l1496_DUPLICATE_cf85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1490_l1496_l1487_l1482_l1479_l1474_DUPLICATE_317f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1493_c30_2c84_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_adf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1491_c3_ea50] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_left;
     BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output := BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_5b5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_adf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1474_c1_5826] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_5b5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1500_c7_adf0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_cond;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output := tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1484_c3_d9de] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output := CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1491_c3_ea50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1484_c3_d9de_return_output;
     VAR_printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1474_c1_5826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_5b5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_adf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- printf_uxn_opcodes_h_l1475_c3_52a8[uxn_opcodes_h_l1475_c3_52a8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1475_c3_52a8_uxn_opcodes_h_l1475_c3_52a8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_adf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- t16_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_adf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- t16_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_ae0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_ae0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_6353] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_7fd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- t16_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_7fd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_8b9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_8b9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c7_0557] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c7_0557_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1474_c2_877e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1511_l1469_DUPLICATE_c3cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1511_l1469_DUPLICATE_c3cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a88(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1474_c2_877e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1474_c2_877e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1511_l1469_DUPLICATE_c3cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1511_l1469_DUPLICATE_c3cc_return_output;
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
