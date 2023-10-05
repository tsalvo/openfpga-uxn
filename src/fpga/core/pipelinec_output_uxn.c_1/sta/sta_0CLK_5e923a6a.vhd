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
-- Submodules: 92
entity sta_0CLK_5e923a6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_5e923a6a;
architecture arch of sta_0CLK_5e923a6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2190_c6_ad8f]
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2190_c1_df4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2190_c2_4e2d]
signal t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2191_c3_e260[uxn_opcodes_h_l2191_c3_e260]
signal printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_4580]
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2196_c7_6755]
signal n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2196_c7_6755]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2196_c7_6755]
signal t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2199_c11_cf0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2199_c7_da35]
signal n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2199_c7_da35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2199_c7_da35]
signal t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2201_c3_1550]
signal CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2204_c11_8586]
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2204_c7_c7bb]
signal t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2207_c11_f992]
signal BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2207_c7_7235]
signal n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2207_c7_7235]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2207_c7_7235]
signal t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2208_c3_2689]
signal BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2211_c11_eced]
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2211_c7_e36b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_f727]
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2214_c7_3605]
signal n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_3605]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2218_c32_4502]
signal BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2218_c32_0f0d]
signal BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2218_c32_f7e9]
signal MUX_uxn_opcodes_h_l2218_c32_f7e9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_ec9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2220_c7_978e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2220_c7_978e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2220_c7_978e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2220_c7_978e]
signal result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_978e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_cdb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_2c4d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_2c4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7563( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f
BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left,
BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right,
BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output);

-- n8_MUX_uxn_opcodes_h_l2190_c2_4e2d
n8_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d
result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- t16_MUX_uxn_opcodes_h_l2190_c2_4e2d
t16_MUX_uxn_opcodes_h_l2190_c2_4e2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond,
t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue,
t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse,
t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

-- printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260
printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260 : entity work.printf_uxn_opcodes_h_l2191_c3_e260_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output);

-- n8_MUX_uxn_opcodes_h_l2196_c7_6755
n8_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755
result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755
result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755
result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- t16_MUX_uxn_opcodes_h_l2196_c7_6755
t16_MUX_uxn_opcodes_h_l2196_c7_6755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond,
t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue,
t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse,
t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output);

-- n8_MUX_uxn_opcodes_h_l2199_c7_da35
n8_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35
result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35
result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35
result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- t16_MUX_uxn_opcodes_h_l2199_c7_da35
t16_MUX_uxn_opcodes_h_l2199_c7_da35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond,
t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue,
t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse,
t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2201_c3_1550
CONST_SL_8_uxn_opcodes_h_l2201_c3_1550 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x,
CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left,
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right,
BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output);

-- n8_MUX_uxn_opcodes_h_l2204_c7_c7bb
n8_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb
result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- t16_MUX_uxn_opcodes_h_l2204_c7_c7bb
t16_MUX_uxn_opcodes_h_l2204_c7_c7bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond,
t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue,
t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse,
t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992
BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left,
BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right,
BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output);

-- n8_MUX_uxn_opcodes_h_l2207_c7_7235
n8_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235
result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235
result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235
result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235
result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235
result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235
result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235
result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- t16_MUX_uxn_opcodes_h_l2207_c7_7235
t16_MUX_uxn_opcodes_h_l2207_c7_7235 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond,
t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue,
t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse,
t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689
BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left,
BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right,
BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left,
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right,
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output);

-- n8_MUX_uxn_opcodes_h_l2211_c7_e36b
n8_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b
result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b
result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b
result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b
result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b
result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output);

-- n8_MUX_uxn_opcodes_h_l2214_c7_3605
n8_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605
result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605
result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605
result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502
BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left,
BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right,
BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d
BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left,
BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right,
BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output);

-- MUX_uxn_opcodes_h_l2218_c32_f7e9
MUX_uxn_opcodes_h_l2218_c32_f7e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2218_c32_f7e9_cond,
MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue,
MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse,
MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e
result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e
result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e
result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output,
 n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output,
 n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output,
 n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output,
 CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output,
 n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output,
 n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output,
 n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output,
 n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output,
 MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2193_c3_2c39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_a33b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_7653 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2205_c3_2aae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_e767 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2212_c3_3606 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2211_c7_e36b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2200_l2208_DUPLICATE_7600_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2231_l2185_DUPLICATE_3905_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2212_c3_3606 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2212_c3_3606;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_7653 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2202_c3_7653;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2193_c3_2c39 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2193_c3_2c39;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_e767 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2209_c3_e767;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_a33b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_a33b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2205_c3_2aae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2205_c3_2aae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := n8;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2211_c7_e36b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2199_c11_cf0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output := result.ram_addr;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_f727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_left;
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output := BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_4580] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_left;
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output := BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2190_c6_ad8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2211_c11_eced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2200_l2208_DUPLICATE_7600 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2200_l2208_DUPLICATE_7600_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2207_c11_f992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_left;
     BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output := BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_cdb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2204_c11_8586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_left;
     BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output := BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2218_c32_4502] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_left;
     BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output := BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_ec9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2218_c32_4502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c6_ad8f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_4580_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_cf0e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2204_c11_8586_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2207_c11_f992_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_eced_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_ec9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_cdb2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2200_l2208_DUPLICATE_7600_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2200_l2208_DUPLICATE_7600_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2190_l2214_l2211_l2207_DUPLICATE_0029_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_e80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2220_l2214_l2211_l2207_DUPLICATE_9498_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2204_l2199_l2226_l2196_l2190_l2214_l2211_l2207_DUPLICATE_02e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2211_l2207_DUPLICATE_9e5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2214_l2211_l2207_DUPLICATE_a7f4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2204_l2199_l2196_l2220_l2190_l2214_l2211_l2207_DUPLICATE_1497_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2211_c7_e36b_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_2c4d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2218_c32_0f0d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_left;
     BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output := BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2220_c7_978e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2220_c7_978e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2220_c7_978e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_2c4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2190_c1_df4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2208_c3_2689] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_left;
     BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output := BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2201_c3_1550] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output := CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- n8_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2218_c32_0f0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2208_c3_2689_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2201_c3_1550_return_output;
     VAR_printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2190_c1_df4c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_2c4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     -- printf_uxn_opcodes_h_l2191_c3_e260[uxn_opcodes_h_l2191_c3_e260] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2191_c3_e260_uxn_opcodes_h_l2191_c3_e260_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- t16_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- MUX[uxn_opcodes_h_l2218_c32_f7e9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2218_c32_f7e9_cond <= VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_cond;
     MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue <= VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iftrue;
     MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse <= VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output := MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2220_c7_978e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_978e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue := VAR_MUX_uxn_opcodes_h_l2218_c32_f7e9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2220_c7_978e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     -- n8_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- t16_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2214_c7_3605] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c7_3605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- n8_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2211_c7_e36b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2211_c7_e36b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- n8_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2207_c7_7235] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2207_c7_7235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     -- n8_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2204_c7_c7bb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- t16_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2204_c7_c7bb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;
     -- n8_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2199_c7_da35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_da35_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2196_c7_6755] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_6755_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c2_4e2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2231_l2185_DUPLICATE_3905 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2231_l2185_DUPLICATE_3905_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7563(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2190_c2_4e2d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2231_l2185_DUPLICATE_3905_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2231_l2185_DUPLICATE_3905_return_output;
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
