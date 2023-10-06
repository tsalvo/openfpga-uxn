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
-- Submodules: 101
entity ldz2_0CLK_2b0015ee is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_2b0015ee;
architecture arch of ldz2_0CLK_2b0015ee is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1700_c6_007c]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1700_c1_72ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1700_c2_f9f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1701_c3_7250[uxn_opcodes_h_l1701_c3_7250]
signal printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_5fa8]
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1706_c7_1774]
signal t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1706_c7_1774]
signal tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1706_c7_1774]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1709_c11_48ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1709_c7_f266]
signal t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1709_c7_f266]
signal tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1709_c7_f266]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1713_c32_4002]
signal BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1713_c32_64ba]
signal BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1713_c32_db17]
signal MUX_uxn_opcodes_h_l1713_c32_db17_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1713_c32_db17_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1713_c32_db17_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1713_c32_db17_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_bad1]
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_1c89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1720_c11_5921]
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1720_c7_6d7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1723_c11_d3e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1723_c7_2afe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1725_c3_d73c]
signal CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1726_c32_a411]
signal BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1728_c11_e04a]
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1728_c7_8678]
signal tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c7_8678]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1729_c32_e965]
signal BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_1ee8]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_83c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1732_c3_4275]
signal BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_5272]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_c71a]
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_c71a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_c71a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_c71a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1740_c34_925d]
signal CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_69be]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_cd3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_cd3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output);

-- t8_MUX_uxn_opcodes_h_l1700_c2_f9f4
t8_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4
tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4
result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

-- printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250
printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250 : entity work.printf_uxn_opcodes_h_l1701_c3_7250_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output);

-- t8_MUX_uxn_opcodes_h_l1706_c7_1774
t8_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1706_c7_1774
tmp16_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774
result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774
result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774
result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774
result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774
result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output);

-- t8_MUX_uxn_opcodes_h_l1709_c7_f266
t8_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1709_c7_f266
tmp16_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266
result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266
result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266
result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266
result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266
result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266
result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002
BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left,
BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right,
BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba
BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left,
BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right,
BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output);

-- MUX_uxn_opcodes_h_l1713_c32_db17
MUX_uxn_opcodes_h_l1713_c32_db17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1713_c32_db17_cond,
MUX_uxn_opcodes_h_l1713_c32_db17_iftrue,
MUX_uxn_opcodes_h_l1713_c32_db17_iffalse,
MUX_uxn_opcodes_h_l1713_c32_db17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89
tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89
result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89
result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89
result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89
result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89
result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left,
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right,
BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d
tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe
tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe
result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe
result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c
CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x,
CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411
BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left,
BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right,
BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left,
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right,
BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1728_c7_8678
tmp16_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678
result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678
result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965
BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left,
BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right,
BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4
tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4
result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4
result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275
BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left,
BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right,
BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1740_c34_925d
CONST_SR_8_uxn_opcodes_h_l1740_c34_925d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x,
CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output,
 t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output,
 t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output,
 t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output,
 MUX_uxn_opcodes_h_l1713_c32_db17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output,
 tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output,
 CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_427e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_7c5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1713_c32_db17_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1713_c32_db17_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_efc0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1729_c21_b5ce_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_5ad0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_37f9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_937a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_c55a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1706_l1709_DUPLICATE_b044_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1721_DUPLICATE_c0e7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1732_l1724_DUPLICATE_ae29_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1747_l1695_DUPLICATE_2fa9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_5ad0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_5ad0;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_427e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_427e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_937a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1739_c3_937a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_7c5a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_7c5a;
     VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1713_c32_4002] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_left;
     BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output := BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_69be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1709_c11_48ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1721_DUPLICATE_c0e7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1721_DUPLICATE_c0e7_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1726_c32_a411] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1740_c34_925d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output := CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_bad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c6_007c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1728_c11_e04a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_1ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_5272] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1729_c32_e965] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_5fa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1732_l1724_DUPLICATE_ae29 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1732_l1724_DUPLICATE_ae29_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1723_c11_d3e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1720_c11_5921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_left;
     BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output := BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1706_l1709_DUPLICATE_b044 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1706_l1709_DUPLICATE_b044_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1713_c32_4002_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_007c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_5fa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_48ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_bad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1720_c11_5921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_d3e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1728_c11_e04a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_1ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_5272_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_69be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1721_DUPLICATE_c0e7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1721_DUPLICATE_c0e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1732_l1724_DUPLICATE_ae29_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1732_l1724_DUPLICATE_ae29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1706_l1709_l1700_DUPLICATE_3ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1706_l1709_l1700_l1728_DUPLICATE_a90c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1731_l1728_DUPLICATE_5657_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1723_l1720_l1709_l1706_l1731_l1700_l1728_DUPLICATE_e327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1706_l1700_l1715_DUPLICATE_3733_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1706_l1709_DUPLICATE_b044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1706_l1709_DUPLICATE_b044_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1742_l1709_l1738_l1706_l1700_l1728_DUPLICATE_4ada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1728_DUPLICATE_d307_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1723_l1720_l1715_l1709_l1738_l1706_l1700_l1728_DUPLICATE_6959_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_c71a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1725_c3_d73c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output := CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1740_c24_c55a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_c55a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1740_c34_925d_return_output);

     -- t8_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1713_c32_64ba] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_left;
     BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output := BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1726_c21_efc0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_efc0_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1726_c32_a411_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1700_c1_72ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_cd3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_cd3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1732_c3_4275] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_left;
     BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output := BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1729_c21_b5ce] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1729_c21_b5ce_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1729_c32_e965_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1713_c32_db17_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1713_c32_64ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1726_c21_efc0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1729_c21_b5ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1740_c24_c55a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1725_c3_d73c_return_output;
     VAR_printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1700_c1_72ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_cd3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     -- t8_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- printf_uxn_opcodes_h_l1701_c3_7250[uxn_opcodes_h_l1701_c3_7250] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1701_c3_7250_uxn_opcodes_h_l1701_c3_7250_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_c71a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_c71a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_c71a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- MUX[uxn_opcodes_h_l1713_c32_db17] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1713_c32_db17_cond <= VAR_MUX_uxn_opcodes_h_l1713_c32_db17_cond;
     MUX_uxn_opcodes_h_l1713_c32_db17_iftrue <= VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iftrue;
     MUX_uxn_opcodes_h_l1713_c32_db17_iffalse <= VAR_MUX_uxn_opcodes_h_l1713_c32_db17_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1713_c32_db17_return_output := MUX_uxn_opcodes_h_l1713_c32_db17_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1736_c24_37f9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_37f9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1732_c3_4275_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1736_c24_37f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue := VAR_MUX_uxn_opcodes_h_l1713_c32_db17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_c71a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- t8_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1731_c7_83c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1731_c7_83c4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1728_c7_8678] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1728_c7_8678_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1723_c7_2afe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_2afe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1720_c7_6d7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1720_c7_6d7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_1c89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1715_c7_1c89_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1709_c7_f266] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1709_c7_f266_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_1774] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_1774_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1700_c2_f9f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1747_l1695_DUPLICATE_2fa9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1747_l1695_DUPLICATE_2fa9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1700_c2_f9f4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1747_l1695_DUPLICATE_2fa9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1747_l1695_DUPLICATE_2fa9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
