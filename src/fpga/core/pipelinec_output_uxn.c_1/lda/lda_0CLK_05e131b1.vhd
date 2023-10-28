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
-- BIN_OP_EQ[uxn_opcodes_h_l1479_c6_29a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1479_c1_f3b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1479_c2_faa5]
signal tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1480_c3_bec9[uxn_opcodes_h_l1480_c3_bec9]
signal printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_2837]
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1484_c7_7aea]
signal tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_c4e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1487_c7_f0f5]
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1489_c3_bd03]
signal CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_1824]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1492_c7_b3b5]
signal tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_5834]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1495_c7_7a46]
signal tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1496_c3_5fe7]
signal BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1498_c30_7ed2]
signal sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_8f99]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1501_c7_3f85]
signal tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1505_c11_f474]
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1505_c7_eac8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1505_c7_eac8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1505_c7_eac8]
signal result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1505_c7_eac8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1505_c7_eac8]
signal tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_92b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1511_c7_4dc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_4dc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_284d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0
BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output);

-- t16_MUX_uxn_opcodes_h_l1479_c2_faa5
t16_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5
result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5
result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5
tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond,
tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

-- printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9
printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9 : entity work.printf_uxn_opcodes_h_l1480_c3_bec9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output);

-- t16_MUX_uxn_opcodes_h_l1484_c7_7aea
t16_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea
result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea
result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea
tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond,
tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue,
tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse,
tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1487_c7_f0f5
t16_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5
tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond,
tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03
CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x,
CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output);

-- t16_MUX_uxn_opcodes_h_l1492_c7_b3b5
t16_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5
tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond,
tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output);

-- t16_MUX_uxn_opcodes_h_l1495_c7_7a46
t16_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46
tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond,
tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue,
tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse,
tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7
BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left,
BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right,
BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2
sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins,
sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x,
sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y,
sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85
result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85
result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85
tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond,
tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue,
tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse,
tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474
BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left,
BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right,
BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8
result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8
tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond,
tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output,
 t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output,
 t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output,
 t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output,
 t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output,
 t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_8956 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_cce7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_ae4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_317b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_a9ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1488_DUPLICATE_5f65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1474_l1516_DUPLICATE_59f6_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_a9ed := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_a9ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_317b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_317b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_cce7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_cce7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_ae4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_ae4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_8956 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1481_c3_8956;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_5834] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_8f99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1479_c6_29a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_92b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1505_c11_f474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_left;
     BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output := BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_1824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1487_c11_c4e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_2837] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_left;
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output := BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1498_c30_7ed2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_ins;
     sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_x;
     sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output := sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1488_DUPLICATE_5f65 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1488_DUPLICATE_5f65_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1479_c6_29a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1487_c11_c4e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_1824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_5834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_8f99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c11_f474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_92b6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1488_DUPLICATE_5f65_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1488_DUPLICATE_5f65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1495_l1492_DUPLICATE_9a4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_2527_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1505_l1501_l1495_l1492_DUPLICATE_0b7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1501_l1492_DUPLICATE_49d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1487_l1484_l1511_l1479_l1501_l1495_l1492_DUPLICATE_5628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1495_l1501_l1505_DUPLICATE_2163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1487_l1484_l1479_l1505_l1501_l1495_l1492_DUPLICATE_e1e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1498_c30_7ed2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1505_c7_eac8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1511_c7_4dc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1505_c7_eac8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1505_c7_eac8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_cond;
     tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output := tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1496_c3_5fe7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_left;
     BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output := BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1489_c3_bd03] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output := CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1479_c1_f3b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_4dc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1496_c3_5fe7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1489_c3_bd03_return_output;
     VAR_printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1479_c1_f3b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_4dc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1505_c7_eac8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;

     -- printf_uxn_opcodes_h_l1480_c3_bec9[uxn_opcodes_h_l1480_c3_bec9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1480_c3_bec9_uxn_opcodes_h_l1480_c3_bec9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1505_c7_eac8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- t16_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c7_eac8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_3f85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- t16_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_3f85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1495_c7_7a46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_7a46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_b3b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_b3b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1487_c7_f0f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1487_c7_f0f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_7aea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_7aea_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1479_c2_faa5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1474_l1516_DUPLICATE_59f6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1474_l1516_DUPLICATE_59f6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_284d(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1479_c2_faa5_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1474_l1516_DUPLICATE_59f6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1474_l1516_DUPLICATE_59f6_return_output;
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
