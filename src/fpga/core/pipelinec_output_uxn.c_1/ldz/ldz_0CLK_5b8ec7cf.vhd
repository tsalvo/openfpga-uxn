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
-- Submodules: 70
entity ldz_0CLK_5b8ec7cf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz_0CLK_5b8ec7cf;
architecture arch of ldz_0CLK_5b8ec7cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1462_c6_ea2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1462_c1_b05a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1462_c2_a3cf]
signal tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1463_c3_054d[uxn_opcodes_h_l1463_c3_054d]
signal printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1468_c11_2f15]
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1468_c7_8e97]
signal tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_d9cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1471_c7_f490]
signal t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_f490]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1471_c7_f490]
signal tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1475_c32_5482]
signal BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1475_c32_ba11]
signal BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1475_c32_0c3d]
signal MUX_uxn_opcodes_h_l1475_c32_0c3d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_0943]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1477_c7_cb83]
signal tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_6d1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1482_c7_ff24]
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_fddd]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1485_c7_9c25]
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_39e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_07fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_07fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f
BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output);

-- t8_MUX_uxn_opcodes_h_l1462_c2_a3cf
t8_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf
tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond,
tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

-- printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d
printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d : entity work.printf_uxn_opcodes_h_l1463_c3_054d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15
BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left,
BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right,
BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output);

-- t8_MUX_uxn_opcodes_h_l1468_c7_8e97
t8_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97
result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97
result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97
result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97
result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97
tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond,
tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue,
tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse,
tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output);

-- t8_MUX_uxn_opcodes_h_l1471_c7_f490
t8_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490
result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490
result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1471_c7_f490
tmp8_MUX_uxn_opcodes_h_l1471_c7_f490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond,
tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue,
tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse,
tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482
BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left,
BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right,
BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11
BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left,
BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right,
BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output);

-- MUX_uxn_opcodes_h_l1475_c32_0c3d
MUX_uxn_opcodes_h_l1475_c32_0c3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1475_c32_0c3d_cond,
MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue,
MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse,
MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83
result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83
result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83
tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond,
tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue,
tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse,
tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24
result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24
result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24
tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond,
tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue,
tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse,
tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25
tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond,
tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue,
tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse,
tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output,
 t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output,
 t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output,
 t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output,
 MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1465_c3_e203 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_42c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_f4b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1468_l1471_DUPLICATE_870a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1480_l1483_DUPLICATE_dff9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1497_l1458_DUPLICATE_e688_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_42c5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_42c5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1465_c3_e203 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1465_c3_e203;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right := to_unsigned(6, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_f4b4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_f4b4;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := tmp8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_d9cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_0943] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_39e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_6d1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1475_c32_5482] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_left;
     BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output := BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1468_l1471_DUPLICATE_870a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1468_l1471_DUPLICATE_870a_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output := result.is_ram_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1468_c11_2f15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1480_l1483_DUPLICATE_dff9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1480_l1483_DUPLICATE_dff9_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1462_c6_ea2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_fddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1475_c32_5482_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c6_ea2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c11_2f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_d9cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_0943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_6d1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_fddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_39e3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1480_l1483_DUPLICATE_dff9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1480_l1483_DUPLICATE_dff9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1462_l1468_l1471_DUPLICATE_ea53_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1462_l1468_l1482_l1471_DUPLICATE_cb9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1468_l1492_l1485_l1482_l1477_l1471_DUPLICATE_f84e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1471_DUPLICATE_ce4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1462_l1477_l1468_DUPLICATE_1533_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1468_l1471_DUPLICATE_870a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1468_l1471_DUPLICATE_870a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1462_l1492_l1482_l1477_l1471_DUPLICATE_2886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1477_l1482_l1471_l1485_DUPLICATE_e566_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1462_l1485_l1482_l1477_l1471_DUPLICATE_18c1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1462_c1_b05a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1475_c32_ba11] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_left;
     BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output := BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- t8_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_07fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_07fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1475_c32_ba11_return_output;
     VAR_printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1462_c1_b05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_07fd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     -- t8_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- printf_uxn_opcodes_h_l1463_c3_054d[uxn_opcodes_h_l1463_c3_054d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1463_c3_054d_uxn_opcodes_h_l1463_c3_054d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- MUX[uxn_opcodes_h_l1475_c32_0c3d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1475_c32_0c3d_cond <= VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_cond;
     MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue <= VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iftrue;
     MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse <= VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output := MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_9c25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue := VAR_MUX_uxn_opcodes_h_l1475_c32_0c3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_9c25_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_ff24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;

     -- t8_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_ff24_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_cb83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_cb83_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_f490] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_f490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c7_8e97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c7_8e97_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c2_a3cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1497_l1458_DUPLICATE_e688 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1497_l1458_DUPLICATE_e688_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0a09(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c2_a3cf_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1497_l1458_DUPLICATE_e688_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0a09_uxn_opcodes_h_l1497_l1458_DUPLICATE_e688_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
