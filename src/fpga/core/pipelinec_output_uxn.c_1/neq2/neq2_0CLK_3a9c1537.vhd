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
-- Submodules: 107
entity neq2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_3a9c1537;
architecture arch of neq2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1228_c6_3bdb]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1228_c1_6008]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c2_c2fa]
signal n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1229_c3_76e7[uxn_opcodes_h_l1229_c3_76e7]
signal printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1234_c11_8414]
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1234_c7_bc10]
signal n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_2a0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1237_c7_db10]
signal t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1237_c7_db10]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1237_c7_db10]
signal n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_9e5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1242_c7_59cb]
signal n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_7f7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_ee2b]
signal n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1246_c3_1e1e]
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_3d80]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1249_c7_6ffe]
signal n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1252_c11_83cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1252_c7_0a47]
signal n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_9af5]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1257_c7_4c14]
signal n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1260_c11_9b81]
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1260_c7_f411]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1260_c7_f411]
signal n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1261_c3_81a5]
signal BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1264_c32_7fa3]
signal BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1264_c32_ebad]
signal BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1264_c32_2b99]
signal MUX_uxn_opcodes_h_l1264_c32_2b99_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1264_c32_2b99_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1266_c11_30da]
signal BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1266_c7_d171]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1266_c7_d171]
signal result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1266_c7_d171]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1266_c7_d171]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1266_c7_d171]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c24_7a03]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1270_c24_b648]
signal MUX_uxn_opcodes_h_l1270_c24_b648_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1270_c24_b648_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1270_c24_b648_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1270_c24_b648_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_fbbb]
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_3f42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_3f42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb
BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c2_c2fa
t16_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa
result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c2_c2fa
n16_MUX_uxn_opcodes_h_l1228_c2_c2fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond,
n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

-- printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7
printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7 : entity work.printf_uxn_opcodes_h_l1229_c3_76e7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414
BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left,
BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right,
BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output);

-- t16_MUX_uxn_opcodes_h_l1234_c7_bc10
t16_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10
result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- n16_MUX_uxn_opcodes_h_l1234_c7_bc10
n16_MUX_uxn_opcodes_h_l1234_c7_bc10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond,
n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue,
n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse,
n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output);

-- t16_MUX_uxn_opcodes_h_l1237_c7_db10
t16_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10
result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- n16_MUX_uxn_opcodes_h_l1237_c7_db10
n16_MUX_uxn_opcodes_h_l1237_c7_db10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond,
n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue,
n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse,
n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output);

-- t16_MUX_uxn_opcodes_h_l1242_c7_59cb
t16_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1242_c7_59cb
n16_MUX_uxn_opcodes_h_l1242_c7_59cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond,
n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue,
n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse,
n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output);

-- t16_MUX_uxn_opcodes_h_l1245_c7_ee2b
t16_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_ee2b
n16_MUX_uxn_opcodes_h_l1245_c7_ee2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e
BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- n16_MUX_uxn_opcodes_h_l1249_c7_6ffe
n16_MUX_uxn_opcodes_h_l1249_c7_6ffe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond,
n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue,
n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse,
n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- n16_MUX_uxn_opcodes_h_l1252_c7_0a47
n16_MUX_uxn_opcodes_h_l1252_c7_0a47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond,
n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue,
n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse,
n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- n16_MUX_uxn_opcodes_h_l1257_c7_4c14
n16_MUX_uxn_opcodes_h_l1257_c7_4c14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond,
n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue,
n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse,
n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left,
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right,
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- n16_MUX_uxn_opcodes_h_l1260_c7_f411
n16_MUX_uxn_opcodes_h_l1260_c7_f411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond,
n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue,
n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse,
n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5
BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left,
BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right,
BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3
BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left,
BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right,
BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad
BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left,
BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right,
BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output);

-- MUX_uxn_opcodes_h_l1264_c32_2b99
MUX_uxn_opcodes_h_l1264_c32_2b99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1264_c32_2b99_cond,
MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue,
MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse,
MUX_uxn_opcodes_h_l1264_c32_2b99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da
BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left,
BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right,
BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171
result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171
result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond,
result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171
result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171
result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03
BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output);

-- MUX_uxn_opcodes_h_l1270_c24_b648
MUX_uxn_opcodes_h_l1270_c24_b648 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1270_c24_b648_cond,
MUX_uxn_opcodes_h_l1270_c24_b648_iftrue,
MUX_uxn_opcodes_h_l1270_c24_b648_iffalse,
MUX_uxn_opcodes_h_l1270_c24_b648_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output,
 t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output,
 t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output,
 t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output,
 t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output,
 MUX_uxn_opcodes_h_l1264_c32_2b99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output,
 MUX_uxn_opcodes_h_l1270_c24_b648_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_942d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_b090 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1240_c3_4048 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_c174 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_91b5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_8a6b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_b846 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_8e20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_baad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1270_c24_b648_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1270_c24_b648_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1266_l1260_DUPLICATE_ce14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1277_l1224_DUPLICATE_f6a3_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_b846 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_b846;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_baad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1269_c3_baad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_8a6b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_8a6b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_c174 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_c174;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_b090 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_b090;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_91b5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_91b5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_8e20 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_8e20;
     VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_942d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_942d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1240_c3_4048 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1240_c3_4048;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c6_3bdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1266_l1260_DUPLICATE_ce14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1266_l1260_DUPLICATE_ce14_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1252_c11_83cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1266_c11_30da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_fbbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c24_7a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_7f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1234_c11_8414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_left;
     BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output := BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_9af5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1260_c11_9b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_9e5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_3d80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1264_c32_7fa3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_left;
     BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output := BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_2a0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1264_c32_7fa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c6_3bdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1234_c11_8414_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_2a0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_9e5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_7f7c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_3d80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_83cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_9af5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_9b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1266_c11_30da_return_output;
     VAR_MUX_uxn_opcodes_h_l1270_c24_b648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c24_7a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_fbbb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1246_l1253_l1238_l1261_DUPLICATE_472d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_f8e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1252_l1249_l1245_l1272_DUPLICATE_b3c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_3323_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1252_l1249_l1245_DUPLICATE_74d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_l1272_DUPLICATE_1233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1266_l1260_DUPLICATE_ce14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1266_l1260_DUPLICATE_ce14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1266_l1237_l1260_l1234_l1257_l1228_l1252_l1249_l1245_DUPLICATE_4946_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1266_c7_d171] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1261_c3_81a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_left;
     BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output := BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_3f42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output;

     -- MUX[uxn_opcodes_h_l1270_c24_b648] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1270_c24_b648_cond <= VAR_MUX_uxn_opcodes_h_l1270_c24_b648_cond;
     MUX_uxn_opcodes_h_l1270_c24_b648_iftrue <= VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iftrue;
     MUX_uxn_opcodes_h_l1270_c24_b648_iffalse <= VAR_MUX_uxn_opcodes_h_l1270_c24_b648_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1270_c24_b648_return_output := MUX_uxn_opcodes_h_l1270_c24_b648_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_3f42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1264_c32_ebad] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_left;
     BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output := BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1228_c1_6008] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1246_c3_1e1e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_left;
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output := BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1266_c7_d171] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1264_c32_ebad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_1e1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1261_c3_81a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1254_DUPLICATE_46b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue := VAR_MUX_uxn_opcodes_h_l1270_c24_b648_return_output;
     VAR_printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1228_c1_6008_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_3f42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1266_c7_d171] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output := result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;

     -- MUX[uxn_opcodes_h_l1264_c32_2b99] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1264_c32_2b99_cond <= VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_cond;
     MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue <= VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iftrue;
     MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse <= VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_return_output := MUX_uxn_opcodes_h_l1264_c32_2b99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1266_c7_d171] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1266_c7_d171] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;

     -- t16_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- printf_uxn_opcodes_h_l1229_c3_76e7[uxn_opcodes_h_l1229_c3_76e7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1229_c3_76e7_uxn_opcodes_h_l1229_c3_76e7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue := VAR_MUX_uxn_opcodes_h_l1264_c32_2b99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1266_c7_d171_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- t16_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- n16_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1260_c7_f411] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_f411_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     -- t16_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- n16_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_4c14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_4c14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- t16_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c7_0a47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;

     -- n16_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_0a47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_6ffe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_6ffe_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_ee2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_ee2b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_59cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_59cb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- n16_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_db10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1237_c7_db10_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- n16_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1234_c7_bc10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1234_c7_bc10_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1228_c2_c2fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1277_l1224_DUPLICATE_f6a3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1277_l1224_DUPLICATE_f6a3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1228_c2_c2fa_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1277_l1224_DUPLICATE_f6a3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1277_l1224_DUPLICATE_f6a3_return_output;
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
