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
-- BIN_OP_EQ[uxn_opcodes_h_l1505_c6_dfc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1505_c1_23dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1505_c2_5063]
signal t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1505_c2_5063]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1505_c2_5063]
signal tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1506_c3_51ae[uxn_opcodes_h_l1506_c3_51ae]
signal printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_17c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1511_c7_915c]
signal t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_915c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1511_c7_915c]
signal tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_d905]
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1514_c7_f35c]
signal tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1518_c32_0a14]
signal BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1518_c32_0a4c]
signal BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1518_c32_641b]
signal MUX_uxn_opcodes_h_l1518_c32_641b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1518_c32_641b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1518_c32_641b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1518_c32_641b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_2ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1520_c7_40c1]
signal tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_5e91]
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_185e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1525_c7_185e]
signal tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1528_c11_e230]
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1528_c7_cd2c]
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1530_c3_4209]
signal CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1531_c32_24c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1533_c11_b165]
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1533_c7_ec7a]
signal tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1534_c32_800f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_d735]
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1536_c7_a117]
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1536_c7_a117]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_a117]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1536_c7_a117]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_a117]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1536_c7_a117]
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1537_c3_90d7]
signal BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_8ce3]
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1543_c7_362e]
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1543_c7_362e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1543_c7_362e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_362e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1545_c34_6a61]
signal CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_7441]
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1547_c7_94ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_94ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0a09( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_ram_read := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9
BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output);

-- t8_MUX_uxn_opcodes_h_l1505_c2_5063
t8_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063
result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063
result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063
result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063
result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063
result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063
result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1505_c2_5063
tmp16_MUX_uxn_opcodes_h_l1505_c2_5063 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond,
tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue,
tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse,
tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

-- printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae
printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae : entity work.printf_uxn_opcodes_h_l1506_c3_51ae_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output);

-- t8_MUX_uxn_opcodes_h_l1511_c7_915c
t8_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c
result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c
result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c
result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c
result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1511_c7_915c
tmp16_MUX_uxn_opcodes_h_l1511_c7_915c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond,
tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output);

-- t8_MUX_uxn_opcodes_h_l1514_c7_f35c
t8_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c
result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c
result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c
tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond,
tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14
BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left,
BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right,
BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c
BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left,
BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right,
BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output);

-- MUX_uxn_opcodes_h_l1518_c32_641b
MUX_uxn_opcodes_h_l1518_c32_641b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1518_c32_641b_cond,
MUX_uxn_opcodes_h_l1518_c32_641b_iftrue,
MUX_uxn_opcodes_h_l1518_c32_641b_iffalse,
MUX_uxn_opcodes_h_l1518_c32_641b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1
result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1
result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1
result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1
tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond,
tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e
result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1525_c7_185e
tmp16_MUX_uxn_opcodes_h_l1525_c7_185e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond,
tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left,
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right,
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c
tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond,
tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1530_c3_4209
CONST_SL_8_uxn_opcodes_h_l1530_c3_4209 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x,
CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5
BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left,
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right,
BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a
tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond,
tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f
BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117
result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1536_c7_a117
tmp16_MUX_uxn_opcodes_h_l1536_c7_a117 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond,
tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue,
tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse,
tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7
BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left,
BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right,
BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61
CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x,
CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output,
 t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output,
 t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output,
 t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output,
 MUX_uxn_opcodes_h_l1518_c32_641b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output,
 CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_6d76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_55e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1518_c32_641b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1518_c32_641b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1531_c21_a900_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1534_c21_1bac_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_de38 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1541_c24_84b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1544_c3_636f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1545_c24_9adb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1514_l1511_DUPLICATE_4827_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1523_l1526_DUPLICATE_69ee_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1529_l1537_DUPLICATE_2f34_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1552_l1500_DUPLICATE_2256_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_55e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_55e2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_de38 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1540_c3_de38;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1544_c3_636f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1544_c3_636f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right := to_unsigned(128, 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_6d76 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1508_c3_6d76;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right := to_unsigned(9, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_7441] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_left;
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output := BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1534_c32_800f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_d905] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_left;
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output := BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_5e91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_left;
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output := BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_2ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1533_c11_b165] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_left;
     BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output := BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1514_l1511_DUPLICATE_4827 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1514_l1511_DUPLICATE_4827_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_d735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_left;
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output := BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1518_c32_0a14] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_left;
     BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output := BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1529_l1537_DUPLICATE_2f34 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1529_l1537_DUPLICATE_2f34_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_8ce3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1523_l1526_DUPLICATE_69ee LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1523_l1526_DUPLICATE_69ee_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_17c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1531_c32_24c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1505_c6_dfc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1528_c11_e230] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_left;
     BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output := BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1545_c34_6a61] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output := CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1518_c32_0a14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1505_c6_dfc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_17c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_d905_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_2ad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_5e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_e230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1533_c11_b165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_d735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_8ce3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_7441_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1523_l1526_DUPLICATE_69ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1523_l1526_DUPLICATE_69ee_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1529_l1537_DUPLICATE_2f34_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1529_l1537_DUPLICATE_2f34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1514_l1505_l1511_DUPLICATE_19c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1505_l1533_l1511_DUPLICATE_458e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1536_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_2bf5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1536_l1505_l1533_l1528_l1525_l1514_l1511_DUPLICATE_f974_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1505_l1520_l1511_DUPLICATE_22b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1514_l1511_DUPLICATE_4827_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1514_l1511_DUPLICATE_4827_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1547_l1514_l1543_l1511_DUPLICATE_bcca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1533_l1528_l1525_l1520_l1514_l1543_DUPLICATE_5439_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1505_l1533_l1528_l1525_l1520_l1514_l1543_l1511_DUPLICATE_e5ca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1543_c7_362e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_94ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1547_c7_94ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1545_c24_9adb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1545_c24_9adb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1545_c34_6a61_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1537_c3_90d7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_left;
     BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output := BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1534_c21_1bac] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1534_c21_1bac_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1534_c32_800f_return_output);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1531_c21_a900] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1531_c21_a900_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1531_c32_24c5_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1530_c3_4209] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output := CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1518_c32_0a4c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_left;
     BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output := BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1505_c1_23dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1518_c32_641b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1518_c32_0a4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1531_c21_a900_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1534_c21_1bac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1545_c24_9adb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1530_c3_4209_return_output;
     VAR_printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1505_c1_23dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1547_c7_94ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1543_c7_362e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1543_c7_362e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1541_c24_84b7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1541_c24_84b7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1537_c3_90d7_return_output);

     -- t8_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- MUX[uxn_opcodes_h_l1518_c32_641b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1518_c32_641b_cond <= VAR_MUX_uxn_opcodes_h_l1518_c32_641b_cond;
     MUX_uxn_opcodes_h_l1518_c32_641b_iftrue <= VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iftrue;
     MUX_uxn_opcodes_h_l1518_c32_641b_iffalse <= VAR_MUX_uxn_opcodes_h_l1518_c32_641b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1518_c32_641b_return_output := MUX_uxn_opcodes_h_l1518_c32_641b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_362e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;

     -- printf_uxn_opcodes_h_l1506_c3_51ae[uxn_opcodes_h_l1506_c3_51ae] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1506_c3_51ae_uxn_opcodes_h_l1506_c3_51ae_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1541_c24_84b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue := VAR_MUX_uxn_opcodes_h_l1518_c32_641b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_362e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- t8_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_a117] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_a117_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1533_c7_ec7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1533_c7_ec7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1528_c7_cd2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_cd2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_185e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_185e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1520_c7_40c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1520_c7_40c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_f35c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_f35c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1511_c7_915c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1511_c7_915c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1505_c2_5063] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1552_l1500_DUPLICATE_2256 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1552_l1500_DUPLICATE_2256_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0a09(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1505_c2_5063_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1505_c2_5063_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1552_l1500_DUPLICATE_2256_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1552_l1500_DUPLICATE_2256_return_output;
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
