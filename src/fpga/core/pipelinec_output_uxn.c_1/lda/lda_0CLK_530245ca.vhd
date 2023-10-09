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
-- Submodules: 88
entity lda_0CLK_530245ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_530245ca;
architecture arch of lda_0CLK_530245ca is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1581_c6_2474]
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1581_c1_ff9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1581_c2_c52e]
signal tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1582_c3_d672[uxn_opcodes_h_l1582_c3_d672]
signal printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_6368]
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1587_c7_454b]
signal t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1587_c7_454b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1587_c7_454b]
signal tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_ba16]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1590_c7_4412]
signal t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1590_c7_4412]
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1590_c7_4412]
signal tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1592_c3_4d63]
signal CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_864f]
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1595_c7_099f]
signal t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_099f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1595_c7_099f]
signal tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_3142]
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1598_c7_3afd]
signal tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1599_c3_7c5e]
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1602_c32_14ad]
signal BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1602_c32_ebc2]
signal BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1602_c32_40cb]
signal MUX_uxn_opcodes_h_l1602_c32_40cb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1602_c32_40cb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1606_c11_b688]
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1606_c7_477e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1606_c7_477e]
signal tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1610_c11_6a07]
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1610_c7_f535]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1610_c7_f535]
signal result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c7_f535]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c7_f535]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c7_f535]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1610_c7_f535]
signal tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_55bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_503b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_503b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474
BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left,
BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right,
BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output);

-- t16_MUX_uxn_opcodes_h_l1581_c2_c52e
t16_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e
result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e
result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e
result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e
tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond,
tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

-- printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672
printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672 : entity work.printf_uxn_opcodes_h_l1582_c3_d672_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output);

-- t16_MUX_uxn_opcodes_h_l1587_c7_454b
t16_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b
result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b
result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1587_c7_454b
tmp8_MUX_uxn_opcodes_h_l1587_c7_454b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond,
tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output);

-- t16_MUX_uxn_opcodes_h_l1590_c7_4412
t16_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412
result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1590_c7_4412
tmp8_MUX_uxn_opcodes_h_l1590_c7_4412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond,
tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue,
tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse,
tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63
CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x,
CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output);

-- t16_MUX_uxn_opcodes_h_l1595_c7_099f
t16_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f
result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1595_c7_099f
tmp8_MUX_uxn_opcodes_h_l1595_c7_099f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond,
tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output);

-- t16_MUX_uxn_opcodes_h_l1598_c7_3afd
t16_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd
result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd
tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond,
tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue,
tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse,
tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e
BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left,
BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right,
BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad
BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left,
BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right,
BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2
BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left,
BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right,
BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output);

-- MUX_uxn_opcodes_h_l1602_c32_40cb
MUX_uxn_opcodes_h_l1602_c32_40cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1602_c32_40cb_cond,
MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue,
MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse,
MUX_uxn_opcodes_h_l1602_c32_40cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688
BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left,
BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right,
BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e
result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e
result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e
result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e
result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1606_c7_477e
tmp8_MUX_uxn_opcodes_h_l1606_c7_477e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond,
tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07
BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left,
BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right,
BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535
result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535
result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1610_c7_f535
tmp8_MUX_uxn_opcodes_h_l1610_c7_f535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond,
tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue,
tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse,
tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output,
 t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output,
 t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output,
 t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output,
 CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output,
 t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output,
 t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output,
 MUX_uxn_opcodes_h_l1602_c32_40cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_4586 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_1c2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_b251 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_19eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0b7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_87da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1622_l1576_DUPLICATE_8178_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_b251 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_b251;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_4586 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_4586;
     VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_19eb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_19eb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0b7a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0b7a;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_1c2e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_1c2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_ba16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1606_c11_b688] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_left;
     BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output := BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_864f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_6368] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_left;
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output := BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_3142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_left;
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output := BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1581_c6_2474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_left;
     BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output := BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_55bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_87da LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_87da_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1610_c11_6a07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1602_c32_14ad] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_left;
     BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output := BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1602_c32_14ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1581_c6_2474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_6368_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_ba16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_864f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_3142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1606_c11_b688_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c11_6a07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_55bc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_87da_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1591_l1599_DUPLICATE_87da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_DUPLICATE_bfcc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1610_l1606_DUPLICATE_ecfe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_b6a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1595_l1590_l1587_l1581_l1606_DUPLICATE_2bac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1587_l1598_l1590_l1595_DUPLICATE_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1617_l1581_l1606_DUPLICATE_7a41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1610_l1598_l1606_DUPLICATE_3a43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1598_l1595_l1590_l1587_l1581_l1610_l1606_DUPLICATE_c9dc_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1592_c3_4d63] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output := CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_503b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1599_c3_7c5e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_left;
     BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output := BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_503b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1602_c32_ebc2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_left;
     BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output := BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1581_c1_ff9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1602_c32_ebc2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1599_c3_7c5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1592_c3_4d63_return_output;
     VAR_printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1581_c1_ff9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_503b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_503b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- printf_uxn_opcodes_h_l1582_c3_d672[uxn_opcodes_h_l1582_c3_d672] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1582_c3_d672_uxn_opcodes_h_l1582_c3_d672_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c7_f535] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;

     -- MUX[uxn_opcodes_h_l1602_c32_40cb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1602_c32_40cb_cond <= VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_cond;
     MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue <= VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iftrue;
     MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse <= VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_return_output := MUX_uxn_opcodes_h_l1602_c32_40cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue := VAR_MUX_uxn_opcodes_h_l1602_c32_40cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c7_f535_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1606_c7_477e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1606_c7_477e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_3afd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_3afd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_099f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_099f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_4412] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c7_4412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1587_c7_454b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1587_c7_454b_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1581_c2_c52e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1622_l1576_DUPLICATE_8178 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1622_l1576_DUPLICATE_8178_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1581_c2_c52e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1622_l1576_DUPLICATE_8178_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1622_l1576_DUPLICATE_8178_return_output;
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
