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
-- Submodules: 136
entity ovr2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_084aa6da;
architecture arch of ovr2_0CLK_084aa6da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l330_c6_32d9]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_b5e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c2_845c]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l330_c2_845c]
signal t16_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l330_c2_845c]
signal n16_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l331_c3_82ea[uxn_opcodes_h_l331_c3_82ea]
signal printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_0128]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l336_c7_1734]
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l336_c7_1734]
signal t16_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l336_c7_1734]
signal n16_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l339_c11_3191]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l339_c7_fa01]
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l339_c7_fa01]
signal t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l339_c7_fa01]
signal n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l344_c11_ec54]
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l344_c7_cf6f]
signal n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l347_c11_d8c4]
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l347_c7_b0ab]
signal n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l348_c3_8f1d]
signal BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l351_c11_a2cb]
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l351_c7_ab4a]
signal n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l354_c11_c7af]
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l354_c7_4a39]
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l354_c7_4a39]
signal n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0951]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l359_c7_56db]
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l359_c7_56db]
signal n16_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_069a]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l362_c7_90fa]
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l362_c7_90fa]
signal n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l363_c3_5b8c]
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l366_c32_bac2]
signal BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l366_c32_46e7]
signal BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l366_c32_8548]
signal MUX_uxn_opcodes_h_l366_c32_8548_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l366_c32_8548_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l366_c32_8548_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l366_c32_8548_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_311f]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_9f3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_9f3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_9f3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_9f3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l368_c7_9f3b]
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l374_c11_2005]
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_bf87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_bf87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_bf87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l374_c7_bf87]
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_30f5]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c7_b5a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b5a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b5a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c7_b5a5]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l382_c11_3f0b]
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l382_c7_f239]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l382_c7_f239]
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l382_c7_f239]
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l382_c7_f239]
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l384_c34_b5a1]
signal CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l386_c11_89cd]
signal BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l386_c7_4753]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l386_c7_4753]
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l386_c7_4753]
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l386_c7_4753]
signal result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l390_c11_eeaa]
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_9642]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_9642]
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_9642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l390_c7_9642]
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l394_c11_570b]
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_81f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_81f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9
BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c
result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- t16_MUX_uxn_opcodes_h_l330_c2_845c
t16_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l330_c2_845c_cond,
t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- n16_MUX_uxn_opcodes_h_l330_c2_845c
n16_MUX_uxn_opcodes_h_l330_c2_845c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l330_c2_845c_cond,
n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue,
n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse,
n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

-- printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea
printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea : entity work.printf_uxn_opcodes_h_l331_c3_82ea_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128
BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734
result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- t16_MUX_uxn_opcodes_h_l336_c7_1734
t16_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l336_c7_1734_cond,
t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- n16_MUX_uxn_opcodes_h_l336_c7_1734
n16_MUX_uxn_opcodes_h_l336_c7_1734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l336_c7_1734_cond,
n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue,
n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse,
n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191
BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- t16_MUX_uxn_opcodes_h_l339_c7_fa01
t16_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- n16_MUX_uxn_opcodes_h_l339_c7_fa01
n16_MUX_uxn_opcodes_h_l339_c7_fa01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond,
n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue,
n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse,
n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54
BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right,
BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f
result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f
result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f
result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- t16_MUX_uxn_opcodes_h_l344_c7_cf6f
t16_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- n16_MUX_uxn_opcodes_h_l344_c7_cf6f
n16_MUX_uxn_opcodes_h_l344_c7_cf6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond,
n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue,
n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse,
n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4
BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left,
BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right,
BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab
result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab
result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab
result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- t16_MUX_uxn_opcodes_h_l347_c7_b0ab
t16_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- n16_MUX_uxn_opcodes_h_l347_c7_b0ab
n16_MUX_uxn_opcodes_h_l347_c7_b0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond,
n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue,
n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse,
n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d
BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left,
BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right,
BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb
BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left,
BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right,
BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a
result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a
result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- n16_MUX_uxn_opcodes_h_l351_c7_ab4a
n16_MUX_uxn_opcodes_h_l351_c7_ab4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond,
n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue,
n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse,
n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af
BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left,
BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right,
BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39
result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39
result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- n16_MUX_uxn_opcodes_h_l354_c7_4a39
n16_MUX_uxn_opcodes_h_l354_c7_4a39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond,
n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue,
n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse,
n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db
result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db
result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- n16_MUX_uxn_opcodes_h_l359_c7_56db
n16_MUX_uxn_opcodes_h_l359_c7_56db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l359_c7_56db_cond,
n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue,
n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse,
n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a
BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa
result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa
result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- n16_MUX_uxn_opcodes_h_l362_c7_90fa
n16_MUX_uxn_opcodes_h_l362_c7_90fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond,
n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue,
n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse,
n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c
BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left,
BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right,
BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2
BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left,
BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right,
BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7
BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left,
BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right,
BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output);

-- MUX_uxn_opcodes_h_l366_c32_8548
MUX_uxn_opcodes_h_l366_c32_8548 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l366_c32_8548_cond,
MUX_uxn_opcodes_h_l366_c32_8548_iftrue,
MUX_uxn_opcodes_h_l366_c32_8548_iffalse,
MUX_uxn_opcodes_h_l366_c32_8548_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f
BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b
result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005
BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right,
BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87
result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5
BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5
result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b
BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left,
BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right,
BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239
result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output);

-- CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1
CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x,
CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd
BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left,
BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right,
BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753
result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753
result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753
result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond,
result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa
BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b
BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420
CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16
CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output,
 MUX_uxn_opcodes_h_l366_c32_8548_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output,
 CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e27a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_633b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l342_c3_6594 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_07ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_260f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_e503 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1a6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_97cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l366_c32_8548_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l366_c32_8548_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l366_c32_8548_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l366_c32_8548_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2064 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_56a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_d51d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l380_c24_633a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_2ab7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l384_c24_cf25_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_8c11 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_8b56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l390_DUPLICATE_64c3_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l372_DUPLICATE_0867_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l376_DUPLICATE_76e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l399_l326_DUPLICATE_5ba2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_2ab7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_2ab7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e27a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e27a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1a6e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1a6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l366_c32_8548_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_MUX_uxn_opcodes_h_l366_c32_8548_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_97cc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l360_c3_97cc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2064 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_2064;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_d51d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_d51d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_07ae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l345_c3_07ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_633b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_633b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_e503 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l352_c3_e503;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_56a7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l375_c3_56a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_8c11 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_8c11;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_260f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_260f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_8b56 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_8b56;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l342_c3_6594 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l342_c3_6594;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right := to_unsigned(9, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l386_c11_89cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0951] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l380_c24_633a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l380_c24_633a_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_AND[uxn_opcodes_h_l366_c32_bac2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_left;
     BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output := BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l382_c11_3f0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c6_32d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l394_c11_570b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_left;
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output := BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_30f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_069a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_0128] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c11_3191] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l390_DUPLICATE_64c3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l390_DUPLICATE_64c3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_311f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l344_c11_ec54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_left;
     BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output := BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l347_c11_d8c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l372_DUPLICATE_0867 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l372_DUPLICATE_0867_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l374_c11_2005] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_left;
     BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output := BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l354_c11_c7af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_left;
     BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output := BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l390_c11_eeaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l351_c11_a2cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l384_c34_b5a1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output := CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l366_c32_bac2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_32d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_0128_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_3191_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c11_ec54_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l347_c11_d8c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l351_c11_a2cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l354_c11_c7af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0951_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_069a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_311f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l374_c11_2005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_30f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l382_c11_3f0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l386_c11_89cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_eeaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_570b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l340_l363_l348_l355_DUPLICATE_b60c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l380_c24_633a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l372_DUPLICATE_0867_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l372_DUPLICATE_0867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l362_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_ed94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l354_l382_l351_l378_l347_l374_l344_l368_l394_l339_DUPLICATE_e534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l336_l359_l330_l354_l351_l347_l344_l368_l339_DUPLICATE_d22b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l362_l336_l359_l354_l351_l347_l344_l339_DUPLICATE_e597_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l362_l390_l336_l359_l386_l330_l354_l382_l351_l378_l347_l374_l344_l394_l339_DUPLICATE_220a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l390_DUPLICATE_64c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l390_DUPLICATE_64c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l362_l390_l336_l359_l330_l354_l351_l347_l344_l339_DUPLICATE_a6bc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_9f3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_81f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_9642] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l376_DUPLICATE_76e1 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l376_DUPLICATE_76e1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l376_l392_DUPLICATE_6b16_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l366_c32_46e7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_left;
     BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output := BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l384_c24_cf25] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l384_c24_cf25_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l384_c34_b5a1_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_81f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l348_c3_8f1d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_left;
     BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output := BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_b5e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l363_c3_5b8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_left;
     BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output := BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l366_c32_8548_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l366_c32_46e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l348_c3_8f1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l363_c3_5b8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l384_c24_cf25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l376_DUPLICATE_76e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l376_DUPLICATE_76e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l356_l341_DUPLICATE_6420_return_output;
     VAR_printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_b5e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_81f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_81f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_9642_return_output;
     -- printf_uxn_opcodes_h_l331_c3_82ea[uxn_opcodes_h_l331_c3_82ea] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l331_c3_82ea_uxn_opcodes_h_l331_c3_82ea_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l390_c7_9642] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_cond;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output := result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- n16_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_9642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_9642] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output;

     -- MUX[uxn_opcodes_h_l366_c32_8548] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l366_c32_8548_cond <= VAR_MUX_uxn_opcodes_h_l366_c32_8548_cond;
     MUX_uxn_opcodes_h_l366_c32_8548_iftrue <= VAR_MUX_uxn_opcodes_h_l366_c32_8548_iftrue;
     MUX_uxn_opcodes_h_l366_c32_8548_iffalse <= VAR_MUX_uxn_opcodes_h_l366_c32_8548_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l366_c32_8548_return_output := MUX_uxn_opcodes_h_l366_c32_8548_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l386_c7_4753] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue := VAR_MUX_uxn_opcodes_h_l366_c32_8548_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_9642_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_9642_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l386_c7_4753_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_9642_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l382_c7_f239] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l386_c7_4753] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_cond;
     result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output := result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output;

     -- n16_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output := n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l386_c7_4753] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output;

     -- t16_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l386_c7_4753] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_n16_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l386_c7_4753_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l386_c7_4753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l382_c7_f239_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l386_c7_4753_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_t16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l382_c7_f239] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output;

     -- n16_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c7_b5a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;

     -- t16_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l382_c7_f239] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l382_c7_f239] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_cond;
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output := result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l382_c7_f239_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l382_c7_f239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l382_c7_f239_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_t16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l374_c7_bf87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;

     -- t16_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output := t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c7_b5a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_b5a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_b5a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;

     -- n16_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_b5a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l374_c7_bf87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l374_c7_bf87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output := result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_9f3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l374_c7_bf87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- t16_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output := t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- n16_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l374_c7_bf87_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l330_c2_845c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l368_c7_9f3b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output := result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;

     -- n16_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_9f3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_9f3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_n16_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_9f3b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- n16_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_90fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_n16_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_90fa_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- n16_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output := n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_56db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l359_c7_56db_return_output;
     -- n16_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output := n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l354_c7_4a39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l330_c2_845c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l354_c7_4a39_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l351_c7_ab4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l351_c7_ab4a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l347_c7_b0ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l347_c7_b0ab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l344_c7_cf6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l344_c7_cf6f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_fa01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fa01_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1734] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_1734_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l330_c2_845c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l399_l326_DUPLICATE_5ba2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l399_l326_DUPLICATE_5ba2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_845c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_845c_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l399_l326_DUPLICATE_5ba2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l399_l326_DUPLICATE_5ba2_return_output;
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
