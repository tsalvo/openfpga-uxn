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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 78
entity sta_0CLK_6c9b19c4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_6c9b19c4;
architecture arch of sta_0CLK_6c9b19c4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2500_c6_bea5]
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2500_c2_9f8b]
signal t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_6a07]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c7_979e]
signal n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_979e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2505_c7_979e]
signal t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2508_c11_7f02]
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2508_c7_58d5]
signal t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2510_c3_1784]
signal CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_aa78]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_438a]
signal n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_438a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_438a]
signal t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_4716]
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2516_c7_f68d]
signal t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2517_c3_bd8c]
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_6ee9]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_ad63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_7036]
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2523_c7_7643]
signal n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_7643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2526_c32_1571]
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2526_c32_dbe6]
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2526_c32_54bb]
signal MUX_uxn_opcodes_h_l2526_c32_54bb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_54bb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_63ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2531_c7_45f1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2531_c7_45f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_45f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4841( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left,
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right,
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output);

-- n8_MUX_uxn_opcodes_h_l2500_c2_9f8b
n8_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- t16_MUX_uxn_opcodes_h_l2500_c2_9f8b
t16_MUX_uxn_opcodes_h_l2500_c2_9f8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond,
t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue,
t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse,
t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c7_979e
n8_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- t16_MUX_uxn_opcodes_h_l2505_c7_979e
t16_MUX_uxn_opcodes_h_l2505_c7_979e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond,
t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue,
t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse,
t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left,
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right,
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output);

-- n8_MUX_uxn_opcodes_h_l2508_c7_58d5
n8_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- t16_MUX_uxn_opcodes_h_l2508_c7_58d5
t16_MUX_uxn_opcodes_h_l2508_c7_58d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond,
t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue,
t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse,
t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2510_c3_1784
CONST_SL_8_uxn_opcodes_h_l2510_c3_1784 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x,
CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_438a
n8_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_438a
t16_MUX_uxn_opcodes_h_l2513_c7_438a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output);

-- n8_MUX_uxn_opcodes_h_l2516_c7_f68d
n8_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- t16_MUX_uxn_opcodes_h_l2516_c7_f68d
t16_MUX_uxn_opcodes_h_l2516_c7_f68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond,
t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue,
t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse,
t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c
BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left,
BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right,
BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output);

-- n8_MUX_uxn_opcodes_h_l2520_c7_ad63
n8_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output);

-- n8_MUX_uxn_opcodes_h_l2523_c7_7643
n8_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571
BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6
BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output);

-- MUX_uxn_opcodes_h_l2526_c32_54bb
MUX_uxn_opcodes_h_l2526_c32_54bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2526_c32_54bb_cond,
MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue,
MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse,
MUX_uxn_opcodes_h_l2526_c32_54bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output,
 n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output,
 n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output,
 CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output,
 n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output,
 n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output,
 n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output,
 MUX_uxn_opcodes_h_l2526_c32_54bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_5de4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_250b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_4c71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_8808 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_afd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_94da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ad63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_c180_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2538_l2495_DUPLICATE_3c6e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_250b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_250b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_5de4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_5de4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_8808 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_8808;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_afd4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_afd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_94da := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_94da;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_4c71 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_4c71;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output := result.ram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2526_c32_1571] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_left;
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output := BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_aa78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2508_c11_7f02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_left;
     BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output := BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_6ee9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_6a07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ad63_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_c180 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_c180_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_4716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_left;
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output := BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_63ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_7036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_left;
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output := BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2500_c6_bea5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_1571_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_bea5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_6a07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_7f02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_aa78_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4716_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6ee9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_63ae_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_c180_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_c180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_8051_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_081b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2531_DUPLICATE_1487_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_edc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2520_l2516_l2513_l2508_l2505_l2531_l2500_DUPLICATE_8ea6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2523_l2520_l2516_l2513_l2508_l2505_l2500_DUPLICATE_17a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ad63_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2531_c7_45f1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2510_c3_1784] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output := CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_45f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2526_c32_dbe6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_left;
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output := BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2531_c7_45f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2517_c3_bd8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_left;
     BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output := BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_dbe6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_bd8c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_1784_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_45f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- MUX[uxn_opcodes_h_l2526_c32_54bb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2526_c32_54bb_cond <= VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_cond;
     MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue <= VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iftrue;
     MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse <= VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_return_output := MUX_uxn_opcodes_h_l2526_c32_54bb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- n8_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- t16_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue := VAR_MUX_uxn_opcodes_h_l2526_c32_54bb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2523_c7_7643] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- n8_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_7643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_ad63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ad63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_f68d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_f68d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_438a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_438a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;
     -- n8_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2508_c7_58d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_58d5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_979e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_979e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c2_9f8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2538_l2495_DUPLICATE_3c6e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2538_l2495_DUPLICATE_3c6e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_9f8b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2538_l2495_DUPLICATE_3c6e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2538_l2495_DUPLICATE_3c6e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
