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
-- Submodules: 63
entity stz_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_fd2391e7;
architecture arch of stz_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1704_c6_dbf5]
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1704_c1_2b65]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1704_c2_8a58]
signal n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1705_c3_1914[uxn_opcodes_h_l1705_c3_1914]
signal printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_9a3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1710_c7_0f73]
signal n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_ea4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_542d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1713_c7_542d]
signal t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1713_c7_542d]
signal n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_8a38]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1717_c7_d4df]
signal n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1720_c11_1802]
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1720_c7_053a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1720_c7_053a]
signal n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1724_c32_a802]
signal BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1724_c32_928f]
signal BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1724_c32_f6e6]
signal MUX_uxn_opcodes_h_l1724_c32_f6e6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_db0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_14ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1729_c7_14ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_14ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5
BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left,
BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right,
BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58
result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58
result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58
result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58
result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58
result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- t8_MUX_uxn_opcodes_h_l1704_c2_8a58
t8_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- n8_MUX_uxn_opcodes_h_l1704_c2_8a58
n8_MUX_uxn_opcodes_h_l1704_c2_8a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond,
n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue,
n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse,
n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

-- printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914
printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914 : entity work.printf_uxn_opcodes_h_l1705_c3_1914_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73
result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73
result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73
result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- t8_MUX_uxn_opcodes_h_l1710_c7_0f73
t8_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- n8_MUX_uxn_opcodes_h_l1710_c7_0f73
n8_MUX_uxn_opcodes_h_l1710_c7_0f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond,
n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue,
n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse,
n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d
result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d
result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d
result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- t8_MUX_uxn_opcodes_h_l1713_c7_542d
t8_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- n8_MUX_uxn_opcodes_h_l1713_c7_542d
n8_MUX_uxn_opcodes_h_l1713_c7_542d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond,
n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue,
n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse,
n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df
result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df
result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- n8_MUX_uxn_opcodes_h_l1717_c7_d4df
n8_MUX_uxn_opcodes_h_l1717_c7_d4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond,
n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue,
n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse,
n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left,
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right,
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a
result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a
result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a
result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a
result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- n8_MUX_uxn_opcodes_h_l1720_c7_053a
n8_MUX_uxn_opcodes_h_l1720_c7_053a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond,
n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue,
n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse,
n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802
BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left,
BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right,
BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f
BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left,
BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right,
BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output);

-- MUX_uxn_opcodes_h_l1724_c32_f6e6
MUX_uxn_opcodes_h_l1724_c32_f6e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1724_c32_f6e6_cond,
MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue,
MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse,
MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae
result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output,
 MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d309 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_4ab6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_986c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1718_c3_0910 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1717_c7_d4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_752a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1700_l1735_DUPLICATE_ea8c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_986c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_986c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1718_c3_0910 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1718_c3_0910;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_4ab6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_4ab6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d309 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_d309;
     VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_9a3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output := result.ram_addr;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1720_c11_1802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_left;
     BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output := BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1724_c32_a802] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_left;
     BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output := BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1704_c6_dbf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_8a38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1726_c21_752a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_752a_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_db0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_ea4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1717_c7_d4df_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1724_c32_a802_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c6_dbf5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_9a3a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_ea4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_8a38_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_1802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_db0e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_752a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_6ade_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_f233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1713_l1710_l1729_l1720_l1717_DUPLICATE_f7a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_7d1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1729_l1717_DUPLICATE_1ef5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1713_l1717_l1710_l1720_DUPLICATE_d8c5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1713_l1710_l1704_l1720_l1717_DUPLICATE_cbe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1717_c7_d4df_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_14ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- n8_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1729_c7_14ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1724_c32_928f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_left;
     BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output := BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1704_c1_2b65] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output;

     -- t8_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_14ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1724_c32_928f_return_output;
     VAR_printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1704_c1_2b65_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_14ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- printf_uxn_opcodes_h_l1705_c3_1914[uxn_opcodes_h_l1705_c3_1914] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1705_c3_1914_uxn_opcodes_h_l1705_c3_1914_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- MUX[uxn_opcodes_h_l1724_c32_f6e6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1724_c32_f6e6_cond <= VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_cond;
     MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue <= VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iftrue;
     MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse <= VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output := MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- t8_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue := VAR_MUX_uxn_opcodes_h_l1724_c32_f6e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1720_c7_053a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- n8_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1720_c7_053a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d4df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d4df_return_output;
     -- n8_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1713_c7_542d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_542d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1710_c7_0f73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1710_c7_0f73_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1704_c2_8a58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1700_l1735_DUPLICATE_ea8c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1700_l1735_DUPLICATE_ea8c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c2_8a58_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1700_l1735_DUPLICATE_ea8c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1700_l1735_DUPLICATE_ea8c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
