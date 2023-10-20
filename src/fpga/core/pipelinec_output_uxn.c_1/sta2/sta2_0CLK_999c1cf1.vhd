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
-- Submodules: 104
entity sta2_0CLK_999c1cf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_999c1cf1;
architecture arch of sta2_0CLK_999c1cf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2484_c6_f7c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2484_c2_e126]
signal n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c2_e126]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2484_c2_e126]
signal t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_fc5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2489_c7_f0a8]
signal t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2492_c11_445d]
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2492_c7_8d3b]
signal t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_8b4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c7_eba9]
signal t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2500_c11_1821]
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2500_c7_19de]
signal n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c7_19de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2500_c7_19de]
signal t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2501_c3_a0a7]
signal BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_78c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_1fbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2507_c11_ff97]
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2507_c7_748c]
signal n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2507_c7_748c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_3bb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_997e]
signal n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_997e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2515_c11_899e]
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2515_c7_116d]
signal n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2515_c7_116d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2516_c3_ea32]
signal BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2518_c30_d912]
signal sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2521_c31_00fa]
signal CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_ecae]
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2523_c7_0f32]
signal result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2523_c7_0f32]
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_0f32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_0f32]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_0f32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2525_c22_5239]
signal BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_b8a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_abe3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2528_c7_abe3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6
BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output);

-- n16_MUX_uxn_opcodes_h_l2484_c2_e126
n16_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126
result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126
result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126
result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- t16_MUX_uxn_opcodes_h_l2484_c2_e126
t16_MUX_uxn_opcodes_h_l2484_c2_e126 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond,
t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue,
t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse,
t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output);

-- n16_MUX_uxn_opcodes_h_l2489_c7_f0a8
n16_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- t16_MUX_uxn_opcodes_h_l2489_c7_f0a8
t16_MUX_uxn_opcodes_h_l2489_c7_f0a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond,
t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue,
t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse,
t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left,
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right,
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output);

-- n16_MUX_uxn_opcodes_h_l2492_c7_8d3b
n16_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- t16_MUX_uxn_opcodes_h_l2492_c7_8d3b
t16_MUX_uxn_opcodes_h_l2492_c7_8d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond,
t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue,
t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse,
t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c7_eba9
n16_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c7_eba9
t16_MUX_uxn_opcodes_h_l2497_c7_eba9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond,
t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821
BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left,
BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right,
BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output);

-- n16_MUX_uxn_opcodes_h_l2500_c7_19de
n16_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de
result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de
result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- t16_MUX_uxn_opcodes_h_l2500_c7_19de
t16_MUX_uxn_opcodes_h_l2500_c7_19de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond,
t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue,
t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse,
t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7
BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left,
BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right,
BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output);

-- n16_MUX_uxn_opcodes_h_l2504_c7_1fbb
n16_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left,
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right,
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output);

-- n16_MUX_uxn_opcodes_h_l2507_c7_748c
n16_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c
result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c
result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c
result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_997e
n16_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left,
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right,
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output);

-- n16_MUX_uxn_opcodes_h_l2515_c7_116d
n16_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d
result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d
result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d
result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d
result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32
BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left,
BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right,
BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2518_c30_d912
sp_relative_shift_uxn_opcodes_h_l2518_c30_d912 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins,
sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x,
sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y,
sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa
CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x,
CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32
result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond,
result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239
BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left,
BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right,
BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3
result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output,
 n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output,
 n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output,
 n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output,
 n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output,
 n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output,
 n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output,
 n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output,
 sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output,
 CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9511 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_f860 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_3904 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_5012 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_6f3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_b29c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_e27b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2513_c3_dd19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2512_c7_997e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2521_c21_6802_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2525_c3_8ce7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2526_c21_fe6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2533_l2480_DUPLICATE_52f5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2513_c3_dd19 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2513_c3_dd19;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9511 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9511;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_3904 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_3904;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_b29c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_b29c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_e27b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_e27b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_5012 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_5012;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_6f3e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_6f3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_f860 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_f860;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2512_c7_997e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_78c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_8b4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_fc5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_3bb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_b8a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2526_c21_fe6a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2526_c21_fe6a_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c6_f7c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2492_c11_445d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l2518_c30_d912] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_ins;
     sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_x;
     sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output := sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2515_c11_899e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_ecae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2500_c11_1821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_left;
     BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output := BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2525_c22_5239] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2507_c11_ff97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c6_f7c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_fc5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_445d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_8b4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c11_1821_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_78c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_ff97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_3bb2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_899e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_ecae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_b8a2_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2525_c3_8ce7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2525_c22_5239_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2493_l2516_l2501_l2508_DUPLICATE_451e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2526_c21_fe6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2492_l2515_DUPLICATE_a016_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_71a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2489_l2512_l2507_l2504_l2500_l2528_l2497_l2523_l2492_l2515_DUPLICATE_5770_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2528_l2497_l2523_l2492_DUPLICATE_3613_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_6e83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2489_l2512_l2484_l2507_l2504_l2500_l2497_l2523_l2492_DUPLICATE_9fc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2518_c30_d912_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2525_c3_8ce7;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_abe3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2523_c7_0f32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output := result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2528_c7_abe3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_0f32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2501_c3_a0a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_left;
     BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output := BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2523_c7_0f32] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output := result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2516_c3_ea32] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_left;
     BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output := BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2501_c3_a0a7_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2516_c3_ea32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2509_l2494_DUPLICATE_c74f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2528_c7_abe3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_0f32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_0f32] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- n16_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2521_c31_00fa] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output := CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_0f32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2521_c21_6802] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2521_c21_6802_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2521_c31_00fa_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2521_c21_6802_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2515_c7_116d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2515_c7_116d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_997e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_997e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- n16_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- t16_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2507_c7_748c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2507_c7_748c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- n16_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_1fbb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_1fbb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2500_c7_19de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2500_c7_19de_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_eba9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_eba9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2492_c7_8d3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2492_c7_8d3b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_f0a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_f0a8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2484_c2_e126] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output := result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2533_l2480_DUPLICATE_52f5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2533_l2480_DUPLICATE_52f5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c2_e126_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2533_l2480_DUPLICATE_52f5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2533_l2480_DUPLICATE_52f5_return_output;
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
