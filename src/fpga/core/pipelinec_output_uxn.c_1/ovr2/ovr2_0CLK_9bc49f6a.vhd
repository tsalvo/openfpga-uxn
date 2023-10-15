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
-- Submodules: 125
entity ovr2_0CLK_9bc49f6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_9bc49f6a;
architecture arch of ovr2_0CLK_9bc49f6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l348_c6_388a]
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l348_c2_c3db]
signal t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_c3db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l348_c2_c3db]
signal n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l353_c11_c24c]
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l353_c7_8d2a]
signal n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_35f8]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l356_c7_9e6e]
signal n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l361_c11_eeeb]
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l361_c7_1ed9]
signal n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_9f9d]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l364_c7_c265]
signal t16_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_c265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l364_c7_c265]
signal n16_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l365_c3_ddbe]
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_cad6]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l368_c7_f8b1]
signal n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l371_c11_6f98]
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_082c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l371_c7_082c]
signal n16_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_02ca]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_c172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l376_c7_c172]
signal n16_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l379_c11_d7bb]
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_89ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l379_c7_89ff]
signal n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l380_c3_d8e5]
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l382_c32_c9f3]
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l382_c32_ab50]
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l382_c32_dabf]
signal MUX_uxn_opcodes_h_l382_c32_dabf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_dabf_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_dabf_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l382_c32_dabf_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_c37c]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l384_c7_168e]
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_168e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_168e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_168e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_168e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l390_c11_8afc]
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l390_c7_5638]
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_5638]
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_5638]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_5638]
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l394_c11_8f4c]
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l394_c7_2a95]
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_2a95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_2a95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_2a95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l398_c11_00bb]
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l398_c7_da9d]
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l398_c7_da9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l398_c7_da9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l398_c7_da9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l400_c34_c726]
signal CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_8530]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_d2ba]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_d2ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_d2ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_d2ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l406_c11_f314]
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l406_c7_1b2d]
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l406_c7_1b2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l406_c7_1b2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l406_c7_1b2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l410_c11_358e]
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_5e37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_5e37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a
BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right,
BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output);

-- t16_MUX_uxn_opcodes_h_l348_c2_c3db
t16_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db
result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- n16_MUX_uxn_opcodes_h_l348_c2_c3db
n16_MUX_uxn_opcodes_h_l348_c2_c3db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond,
n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue,
n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse,
n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c
BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right,
BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output);

-- t16_MUX_uxn_opcodes_h_l353_c7_8d2a
t16_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a
result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- n16_MUX_uxn_opcodes_h_l353_c7_8d2a
n16_MUX_uxn_opcodes_h_l353_c7_8d2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond,
n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue,
n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse,
n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8
BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output);

-- t16_MUX_uxn_opcodes_h_l356_c7_9e6e
t16_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e
result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- n16_MUX_uxn_opcodes_h_l356_c7_9e6e
n16_MUX_uxn_opcodes_h_l356_c7_9e6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond,
n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue,
n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse,
n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb
BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right,
BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output);

-- t16_MUX_uxn_opcodes_h_l361_c7_1ed9
t16_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9
result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- n16_MUX_uxn_opcodes_h_l361_c7_1ed9
n16_MUX_uxn_opcodes_h_l361_c7_1ed9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond,
n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue,
n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse,
n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d
BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output);

-- t16_MUX_uxn_opcodes_h_l364_c7_c265
t16_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l364_c7_c265_cond,
t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265
result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- n16_MUX_uxn_opcodes_h_l364_c7_c265
n16_MUX_uxn_opcodes_h_l364_c7_c265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l364_c7_c265_cond,
n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue,
n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse,
n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe
BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right,
BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1
result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- n16_MUX_uxn_opcodes_h_l368_c7_f8b1
n16_MUX_uxn_opcodes_h_l368_c7_f8b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond,
n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue,
n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse,
n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98
BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right,
BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c
result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- n16_MUX_uxn_opcodes_h_l371_c7_082c
n16_MUX_uxn_opcodes_h_l371_c7_082c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l371_c7_082c_cond,
n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue,
n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse,
n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172
result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- n16_MUX_uxn_opcodes_h_l376_c7_c172
n16_MUX_uxn_opcodes_h_l376_c7_c172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l376_c7_c172_cond,
n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue,
n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse,
n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb
BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right,
BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff
result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- n16_MUX_uxn_opcodes_h_l379_c7_89ff
n16_MUX_uxn_opcodes_h_l379_c7_89ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond,
n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue,
n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse,
n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5
BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left,
BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right,
BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left,
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right,
BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50
BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left,
BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right,
BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output);

-- MUX_uxn_opcodes_h_l382_c32_dabf
MUX_uxn_opcodes_h_l382_c32_dabf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l382_c32_dabf_cond,
MUX_uxn_opcodes_h_l382_c32_dabf_iftrue,
MUX_uxn_opcodes_h_l382_c32_dabf_iffalse,
MUX_uxn_opcodes_h_l382_c32_dabf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c
BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e
result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc
BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right,
BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638
result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c
BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right,
BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95
result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb
BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left,
BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right,
BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d
result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l400_c34_c726
CONST_SR_8_uxn_opcodes_h_l400_c34_c726 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x,
CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530
BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba
result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314
BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left,
BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right,
BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d
result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e
BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right,
BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output,
 t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output,
 t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output,
 t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output,
 t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output,
 t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output,
 BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output,
 MUX_uxn_opcodes_h_l382_c32_dabf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output,
 CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_4f50 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_36c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_98f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_8421 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_0941 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_dd66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_3491 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1d0f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_dabf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l382_c32_dabf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_009c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_c466 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_e366 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_43e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_71cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_fb0a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_f7a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_68c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_9cb1_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_6237_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_d22e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l415_l344_DUPLICATE_adc0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_0941 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_0941;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_009c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l387_c3_009c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right := to_unsigned(12, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_f7a2 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l403_c3_f7a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_36c3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_36c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_c466 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_c466;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1d0f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_1d0f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_8421 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_8421;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_e366 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l395_c3_e366;
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right := to_unsigned(13, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_71cd := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l399_c3_71cd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_68c1 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l407_c3_68c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_dd66 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_dd66;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_4f50 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l350_c3_4f50;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_98f5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_98f5;
     VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_3491 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l374_c3_3491;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := t16;
     -- BIN_OP_AND[uxn_opcodes_h_l382_c32_c9f3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_left;
     BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output := BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l353_c11_c24c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_left;
     BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output := BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l390_c11_8afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_left;
     BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output := BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_8530] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l406_c11_f314] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_left;
     BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output := BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l396_c24_43e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_43e8_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l398_c11_00bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l379_c11_d7bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l400_c34_c726] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x <= VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output := CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l348_c6_388a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_left;
     BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output := BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_35f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l361_c11_eeeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_02ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l371_c11_6f98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_left;
     BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output := BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l394_c11_8f4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output := result.is_opc_done;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_c37c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_6237 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_6237_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_cad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_9cb1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_9cb1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l410_c11_358e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_left;
     BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output := BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_9f9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left := VAR_BIN_OP_AND_uxn_opcodes_h_l382_c32_c9f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l348_c6_388a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l353_c11_c24c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_35f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l361_c11_eeeb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_9f9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_cad6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l371_c11_6f98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l379_c11_d7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_c37c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l390_c11_8afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l394_c11_8f4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l398_c11_00bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_8530_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l406_c11_f314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l410_c11_358e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l365_l357_l372_l380_DUPLICATE_aa8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l396_c24_43e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_6237_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l388_l404_DUPLICATE_6237_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l356_l376_l348_l379_l371_l364_l361_l353_l368_DUPLICATE_a974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l356_l376_l379_l394_l406_l410_l371_l364_l384_l361_l353_l390_l398_l402_l368_DUPLICATE_dc07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l356_l376_l348_l371_l364_l384_l361_l353_l368_DUPLICATE_06d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l356_l376_l348_l379_l394_l406_l410_l371_l364_l361_l353_l390_l398_l402_l368_DUPLICATE_8ffd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_9cb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l379_l406_DUPLICATE_9cb1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l356_l376_l348_l379_l406_l371_l364_l361_l353_l368_DUPLICATE_941d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l410_c7_5e37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l384_c7_168e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_d22e LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_d22e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_9c21_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l400_c24_fb0a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_fb0a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l400_c34_c726_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l365_c3_ddbe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_left;
     BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output := BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l380_c3_d8e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_left;
     BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output := BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l410_c7_5e37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l406_c7_1b2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l382_c32_ab50] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_left;
     BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output := BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l382_c32_dabf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l382_c32_ab50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l365_c3_ddbe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l380_c3_d8e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l400_c24_fb0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l392_l408_DUPLICATE_d22e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l358_l373_DUPLICATE_c33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l410_c7_5e37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l384_c7_168e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l410_c7_5e37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l406_c7_1b2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_d2ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l406_c7_1b2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;

     -- t16_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output := t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- MUX[uxn_opcodes_h_l382_c32_dabf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l382_c32_dabf_cond <= VAR_MUX_uxn_opcodes_h_l382_c32_dabf_cond;
     MUX_uxn_opcodes_h_l382_c32_dabf_iftrue <= VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iftrue;
     MUX_uxn_opcodes_h_l382_c32_dabf_iffalse <= VAR_MUX_uxn_opcodes_h_l382_c32_dabf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l382_c32_dabf_return_output := MUX_uxn_opcodes_h_l382_c32_dabf_return_output;

     -- n16_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l406_c7_1b2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue := VAR_MUX_uxn_opcodes_h_l382_c32_dabf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_n16_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l406_c7_1b2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output := n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_d2ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_d2ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l398_c7_da9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;

     -- t16_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_d2ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_d2ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     -- n16_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output := n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- t16_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l398_c7_da9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l394_c7_2a95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l398_c7_da9d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output := result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l398_c7_da9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l398_c7_da9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l394_c7_2a95] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_cond;
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output := result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;

     -- t16_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- n16_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l394_c7_2a95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l390_c7_5638] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l394_c7_2a95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_n16_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l390_c7_5638_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l394_c7_2a95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l390_c7_5638] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- n16_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output := n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_168e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output;

     -- t16_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l390_c7_5638] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l390_c7_5638] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_cond;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output := result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l390_c7_5638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l390_c7_5638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_168e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l390_c7_5638_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_168e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l384_c7_168e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l384_c7_168e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output := result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_168e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l384_c7_168e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l384_c7_168e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- n16_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l379_c7_89ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l379_c7_89ff_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- n16_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_c172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l376_c7_c172_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l371_c7_082c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output;

     -- n16_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l371_c7_082c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_f8b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l368_c7_f8b1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l364_c7_c265] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_cond;
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output := result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c7_c265_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l361_c7_1ed9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l361_c7_1ed9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_9e6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l356_c7_9e6e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l353_c7_8d2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l353_c7_8d2a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l348_c2_c3db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l415_l344_DUPLICATE_adc0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l415_l344_DUPLICATE_adc0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l348_c2_c3db_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l348_c2_c3db_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l415_l344_DUPLICATE_adc0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l415_l344_DUPLICATE_adc0_return_output;
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
