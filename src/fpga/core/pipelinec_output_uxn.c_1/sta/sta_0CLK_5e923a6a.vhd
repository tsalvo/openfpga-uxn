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
-- BIN_OP_EQ[uxn_opcodes_h_l2045_c6_6a5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_7957]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2045_c2_331c]
signal t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c2_331c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2045_c2_331c]
signal n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2046_c3_c3d4[uxn_opcodes_h_l2046_c3_c3d4]
signal printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_f2ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2051_c7_ad45]
signal n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_8960]
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2054_c7_0b09]
signal n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2056_c3_e997]
signal CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_caa5]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2059_c7_d4cd]
signal n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_b1e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2062_c7_dbe3]
signal n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2063_c3_3844]
signal BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_c758]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2066_c7_e3a2]
signal n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_2dc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2069_c7_565e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2069_c7_565e]
signal n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2073_c32_4581]
signal BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2073_c32_4aaf]
signal BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2073_c32_5a2f]
signal MUX_uxn_opcodes_h_l2073_c32_5a2f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_c331]
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2075_c7_069d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2075_c7_069d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2075_c7_069d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2075_c7_069d]
signal result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2075_c7_069d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_bd70]
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c7_39ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2081_c7_39ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a413( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.ram_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output);

-- t16_MUX_uxn_opcodes_h_l2045_c2_331c
t16_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c
result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c
result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c
result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c
result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- n8_MUX_uxn_opcodes_h_l2045_c2_331c
n8_MUX_uxn_opcodes_h_l2045_c2_331c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond,
n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue,
n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse,
n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

-- printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4
printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4 : entity work.printf_uxn_opcodes_h_l2046_c3_c3d4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output);

-- t16_MUX_uxn_opcodes_h_l2051_c7_ad45
t16_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45
result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45
result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45
result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45
result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- n8_MUX_uxn_opcodes_h_l2051_c7_ad45
n8_MUX_uxn_opcodes_h_l2051_c7_ad45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond,
n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue,
n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse,
n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output);

-- t16_MUX_uxn_opcodes_h_l2054_c7_0b09
t16_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09
result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09
result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09
result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- n8_MUX_uxn_opcodes_h_l2054_c7_0b09
n8_MUX_uxn_opcodes_h_l2054_c7_0b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond,
n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue,
n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse,
n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2056_c3_e997
CONST_SL_8_uxn_opcodes_h_l2056_c3_e997 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x,
CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output);

-- t16_MUX_uxn_opcodes_h_l2059_c7_d4cd
t16_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- n8_MUX_uxn_opcodes_h_l2059_c7_d4cd
n8_MUX_uxn_opcodes_h_l2059_c7_d4cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond,
n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue,
n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse,
n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output);

-- t16_MUX_uxn_opcodes_h_l2062_c7_dbe3
t16_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- n8_MUX_uxn_opcodes_h_l2062_c7_dbe3
n8_MUX_uxn_opcodes_h_l2062_c7_dbe3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond,
n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue,
n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse,
n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844
BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left,
BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right,
BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- n8_MUX_uxn_opcodes_h_l2066_c7_e3a2
n8_MUX_uxn_opcodes_h_l2066_c7_e3a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond,
n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue,
n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse,
n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e
result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e
result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e
result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e
result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- n8_MUX_uxn_opcodes_h_l2069_c7_565e
n8_MUX_uxn_opcodes_h_l2069_c7_565e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond,
n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue,
n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse,
n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581
BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left,
BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right,
BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf
BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left,
BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right,
BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output);

-- MUX_uxn_opcodes_h_l2073_c32_5a2f
MUX_uxn_opcodes_h_l2073_c32_5a2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2073_c32_5a2f_cond,
MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue,
MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse,
MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right,
BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d
result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d
result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d
result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d
result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d
result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff
result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output,
 t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output,
 t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output,
 t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output,
 CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output,
 t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output,
 t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output,
 MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2048_c3_4046 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2052_c3_ed62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_51d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_44e5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_db27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2067_c3_5eba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2066_c7_e3a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2063_l2055_DUPLICATE_aae8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2086_l2040_DUPLICATE_1e7c_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2052_c3_ed62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2052_c3_ed62;
     VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_51d7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_51d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2067_c3_5eba := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2067_c3_5eba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_db27 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_db27;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2048_c3_4046 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2048_c3_4046;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_44e5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_44e5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := n8;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c6_6a5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2075_c11_c331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_left;
     BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output := BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_f2ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_c758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_2dc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_bd70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_b1e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2063_l2055_DUPLICATE_aae8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2063_l2055_DUPLICATE_aae8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_8960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_left;
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output := BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2073_c32_4581] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_left;
     BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output := BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output := result.ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2066_c7_e3a2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_caa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2073_c32_4581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_6a5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_f2ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_8960_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_caa5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_b1e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_c758_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_2dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2075_c11_c331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_bd70_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2063_l2055_DUPLICATE_aae8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2063_l2055_DUPLICATE_aae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2054_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_091a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_0d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2075_l2069_l2066_l2062_l2059_DUPLICATE_4e18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2054_l2081_l2051_l2045_l2069_l2066_l2062_l2059_DUPLICATE_9293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2066_l2062_l2059_DUPLICATE_0fb3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2054_l2051_l2069_l2066_l2062_l2059_DUPLICATE_889f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2054_l2051_l2075_l2045_l2069_l2066_l2062_l2059_DUPLICATE_7330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2075_c7_069d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_7957] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output;

     -- n8_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2081_c7_39ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2063_c3_3844] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_left;
     BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output := BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2075_c7_069d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c7_39ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2056_c3_e997] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output := CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2073_c32_4aaf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_left;
     BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output := BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2075_c7_069d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2073_c32_4aaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2063_c3_3844_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2056_c3_e997_return_output;
     VAR_printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_7957_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2081_c7_39ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2075_c7_069d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2075_c7_069d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- printf_uxn_opcodes_h_l2046_c3_c3d4[uxn_opcodes_h_l2046_c3_c3d4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2046_c3_c3d4_uxn_opcodes_h_l2046_c3_c3d4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_value_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- MUX[uxn_opcodes_h_l2073_c32_5a2f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2073_c32_5a2f_cond <= VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_cond;
     MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue <= VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iftrue;
     MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse <= VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output := MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue := VAR_MUX_uxn_opcodes_h_l2073_c32_5a2f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2075_c7_069d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2069_c7_565e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2069_c7_565e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_e3a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- n8_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_e3a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2062_c7_dbe3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- n8_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- t16_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_dbe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- n8_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2059_c7_d4cd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_d4cd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- n8_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2054_c7_0b09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_0b09_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2051_c7_ad45] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_ad45_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c2_331c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2086_l2040_DUPLICATE_1e7c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2086_l2040_DUPLICATE_1e7c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a413(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2045_c2_331c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_331c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2086_l2040_DUPLICATE_1e7c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2086_l2040_DUPLICATE_1e7c_return_output;
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
