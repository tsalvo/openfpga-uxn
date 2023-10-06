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
-- BIN_OP_EQ[uxn_opcodes_h_l1657_c6_b22b]
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1657_c1_af50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1657_c2_b3cf]
signal tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1658_c3_7642[uxn_opcodes_h_l1658_c3_7642]
signal printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_b88a]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1663_c7_abea]
signal t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1663_c7_abea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1663_c7_abea]
signal tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_cbbe]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1666_c7_f0ec]
signal tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1670_c32_4edb]
signal BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1670_c32_4843]
signal BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1670_c32_12c5]
signal MUX_uxn_opcodes_h_l1670_c32_12c5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1670_c32_12c5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_e604]
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1672_c7_ad07]
signal tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_f9df]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1677_c7_c9c7]
signal tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_e1e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1680_c7_141f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1680_c7_141f]
signal result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_141f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c7_141f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_141f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1680_c7_141f]
signal tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1687_c11_baa5]
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1687_c7_2ec7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1687_c7_2ec7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b
BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left,
BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right,
BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output);

-- t8_MUX_uxn_opcodes_h_l1657_c2_b3cf
t8_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf
result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf
tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond,
tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

-- printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642
printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642 : entity work.printf_uxn_opcodes_h_l1658_c3_7642_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output);

-- t8_MUX_uxn_opcodes_h_l1663_c7_abea
t8_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea
result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1663_c7_abea
tmp8_MUX_uxn_opcodes_h_l1663_c7_abea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond,
tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue,
tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse,
tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output);

-- t8_MUX_uxn_opcodes_h_l1666_c7_f0ec
t8_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec
result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec
tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond,
tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue,
tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse,
tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb
BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left,
BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right,
BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843
BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left,
BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right,
BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output);

-- MUX_uxn_opcodes_h_l1670_c32_12c5
MUX_uxn_opcodes_h_l1670_c32_12c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1670_c32_12c5_cond,
MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue,
MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse,
MUX_uxn_opcodes_h_l1670_c32_12c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07
result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07
result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07
result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07
tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond,
tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue,
tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse,
tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7
tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond,
tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f
result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f
result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1680_c7_141f
tmp8_MUX_uxn_opcodes_h_l1680_c7_141f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond,
tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left,
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right,
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output,
 t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output,
 t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output,
 t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output,
 MUX_uxn_opcodes_h_l1670_c32_12c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_c325 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_6114 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_0234 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1666_l1663_DUPLICATE_f33c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1675_l1678_DUPLICATE_2bcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1692_l1653_DUPLICATE_38a2_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_c325 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1660_c3_c325;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_6114 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_6114;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_0234 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_0234;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_cbbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_f9df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1670_c32_4edb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_left;
     BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output := BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1666_l1663_DUPLICATE_f33c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1666_l1663_DUPLICATE_f33c_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_e604] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_left;
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output := BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1657_c6_b22b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_b88a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1687_c11_baa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1675_l1678_DUPLICATE_2bcb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1675_l1678_DUPLICATE_2bcb_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_e1e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1670_c32_4edb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c6_b22b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_b88a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_cbbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e604_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_f9df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_e1e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_baa5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1675_l1678_DUPLICATE_2bcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1675_l1678_DUPLICATE_2bcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1666_l1657_l1663_DUPLICATE_ad49_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1666_l1657_l1663_l1677_DUPLICATE_d3c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1680_l1677_l1672_l1666_l1663_DUPLICATE_70c7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1666_l1663_DUPLICATE_4a69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1657_l1672_l1663_DUPLICATE_1cde_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1666_l1663_DUPLICATE_f33c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1666_l1663_DUPLICATE_f33c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1657_l1687_l1677_l1672_l1666_l1663_DUPLICATE_889c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_l1680_l1672_l1677_DUPLICATE_8f69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1657_l1680_l1677_l1672_l1666_l1663_DUPLICATE_266b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1657_c1_af50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1687_c7_2ec7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1670_c32_4843] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_left;
     BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output := BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1687_c7_2ec7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1670_c32_4843_return_output;
     VAR_printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1657_c1_af50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_2ec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     -- printf_uxn_opcodes_h_l1658_c3_7642[uxn_opcodes_h_l1658_c3_7642] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1658_c3_7642_uxn_opcodes_h_l1658_c3_7642_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- MUX[uxn_opcodes_h_l1670_c32_12c5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1670_c32_12c5_cond <= VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_cond;
     MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue <= VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iftrue;
     MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse <= VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_return_output := MUX_uxn_opcodes_h_l1670_c32_12c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_141f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue := VAR_MUX_uxn_opcodes_h_l1670_c32_12c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_141f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_c9c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- t8_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_c9c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1672_c7_ad07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_ad07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_f0ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1666_c7_f0ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_abea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_abea_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c2_b3cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1692_l1653_DUPLICATE_38a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1692_l1653_DUPLICATE_38a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1657_c2_b3cf_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1692_l1653_DUPLICATE_38a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1692_l1653_DUPLICATE_38a2_return_output;
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
