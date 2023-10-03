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
-- Submodules: 73
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1484_c6_4ef4]
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1484_c1_974c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1484_c2_4402]
signal tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1484_c2_4402]
signal t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1484_c2_4402]
signal n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1484_c2_4402]
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1485_c3_d76d[uxn_opcodes_h_l1485_c3_d76d]
signal printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_c8be]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_eb53]
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_f657]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1493_c7_12f6]
signal result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_5c72]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1497_c7_e5f3]
signal result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_93f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1500_c7_a402]
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1500_c7_a402]
signal n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1500_c7_a402]
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1504_c32_ca33]
signal BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1504_c32_a7fa]
signal BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1504_c32_58b7]
signal MUX_uxn_opcodes_h_l1504_c32_58b7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1504_c32_58b7_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_dfcc]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1506_c7_e78d]
signal result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1507_c18_e0b1]
signal BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1507_c11_a39f]
signal BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1507_c34_38b6]
signal CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1507_c11_36ef]
signal BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1513_c11_61a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c7_06ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c7_06ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4
BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left,
BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right,
BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1484_c2_4402
tmp8_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- t8_MUX_uxn_opcodes_h_l1484_c2_4402
t8_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- n8_MUX_uxn_opcodes_h_l1484_c2_4402
n8_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402
result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402
result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond,
result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

-- printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d
printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d : entity work.printf_uxn_opcodes_h_l1485_c3_d76d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53
tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- t8_MUX_uxn_opcodes_h_l1490_c7_eb53
t8_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- n8_MUX_uxn_opcodes_h_l1490_c7_eb53
n8_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53
result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6
tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c7_12f6
t8_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- n8_MUX_uxn_opcodes_h_l1493_c7_12f6
n8_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6
result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3
tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- n8_MUX_uxn_opcodes_h_l1497_c7_e5f3
n8_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3
result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1500_c7_a402
tmp8_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- n8_MUX_uxn_opcodes_h_l1500_c7_a402
n8_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33
BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left,
BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right,
BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa
BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left,
BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right,
BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output);

-- MUX_uxn_opcodes_h_l1504_c32_58b7
MUX_uxn_opcodes_h_l1504_c32_58b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1504_c32_58b7_cond,
MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue,
MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse,
MUX_uxn_opcodes_h_l1504_c32_58b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d
tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d
result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1
BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left,
BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right,
BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f
BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left,
BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right,
BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6
CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x,
CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef
BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left,
BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right,
BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3
BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output);



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
 t8,
 n8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output,
 tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output,
 tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output,
 tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output,
 tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output,
 MUX_uxn_opcodes_h_l1504_c32_58b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output,
 tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output,
 CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_4fb8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_b9b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_6836 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_5773 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_316f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1506_l1500_DUPLICATE_33fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1518_l1480_DUPLICATE_c43f_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_6836 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1495_c3_6836;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_4fb8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_4fb8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_b9b9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_b9b9;
     VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_316f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_316f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_5773 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_5773;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l1507_c34_38b6] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output := CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1506_l1500_DUPLICATE_33fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1506_l1500_DUPLICATE_33fc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1507_c18_e0b1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_left;
     BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output := BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1504_c32_ca33] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_left;
     BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output := BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_dfcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_5c72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_93f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_f657] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1484_c6_4ef4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_c8be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1513_c11_61a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1504_c32_ca33_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c18_e0b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c6_4ef4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_c8be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_f657_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_5c72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_93f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_dfcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c11_61a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1490_l1493_l1497_l1484_l1500_DUPLICATE_c779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1513_l1497_l1500_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_DUPLICATE_53f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1490_l1497_l1493_l1500_DUPLICATE_6225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1490_l1493_l1513_l1497_l1484_l1500_DUPLICATE_c06b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1506_l1500_DUPLICATE_33fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1506_l1500_DUPLICATE_33fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1490_l1506_l1493_l1497_l1484_l1500_DUPLICATE_d175_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right := VAR_CONST_SR_4_uxn_opcodes_h_l1507_c34_38b6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c7_06ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1484_c1_974c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1504_c32_a7fa] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_left;
     BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output := BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c7_06ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1507_c11_a39f] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_left;
     BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output := BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1504_c32_a7fa_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1507_c11_a39f_return_output;
     VAR_printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1484_c1_974c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c7_06ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l1507_c11_36ef] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_left;
     BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output := BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- MUX[uxn_opcodes_h_l1504_c32_58b7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1504_c32_58b7_cond <= VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_cond;
     MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue <= VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iftrue;
     MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse <= VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_return_output := MUX_uxn_opcodes_h_l1504_c32_58b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- printf_uxn_opcodes_h_l1485_c3_d76d[uxn_opcodes_h_l1485_c3_d76d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1485_c3_d76d_uxn_opcodes_h_l1485_c3_d76d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- n8_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1507_c11_36ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue := VAR_MUX_uxn_opcodes_h_l1504_c32_58b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- n8_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1506_c7_e78d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_cond;
     tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output := tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1506_c7_e78d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- n8_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1500_c7_a402] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_cond;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output := tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1500_c7_a402_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1497_c7_e5f3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_cond;
     tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output := tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1497_c7_e5f3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1493_c7_12f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_12f6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1490_c7_eb53] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_cond;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output := tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_eb53_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1484_c2_4402] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_cond;
     tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output := tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1484_c2_4402_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1518_l1480_DUPLICATE_c43f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1518_l1480_DUPLICATE_c43f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c2_4402_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c2_4402_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1518_l1480_DUPLICATE_c43f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1518_l1480_DUPLICATE_c43f_return_output;
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
