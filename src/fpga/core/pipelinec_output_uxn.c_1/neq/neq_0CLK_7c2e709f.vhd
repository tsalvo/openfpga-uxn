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
-- Submodules: 65
entity neq_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_7c2e709f;
architecture arch of neq_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1236_c6_85d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1236_c1_cb93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c2_6faa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1237_c3_1810[uxn_opcodes_h_l1237_c3_1810]
signal printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_865f]
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1242_c7_1957]
signal n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1242_c7_1957]
signal t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_1957]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_90a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_7e7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_e14f]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_bee3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1252_c11_23dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c7_a8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1256_c32_8b27]
signal BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1256_c32_3419]
signal BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1256_c32_9357]
signal MUX_uxn_opcodes_h_l1256_c32_9357_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1256_c32_9357_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1256_c32_9357_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1256_c32_9357_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_1fdb]
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_b3e6]
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_b3e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_b3e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_b3e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_b3e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1262_c24_f4c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1262_c24_ea2d]
signal MUX_uxn_opcodes_h_l1262_c24_ea2d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1264_c11_51e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1264_c7_11ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1264_c7_11ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output);

-- n8_MUX_uxn_opcodes_h_l1236_c2_6faa
n8_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- t8_MUX_uxn_opcodes_h_l1236_c2_6faa
t8_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

-- printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810
printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810 : entity work.printf_uxn_opcodes_h_l1237_c3_1810_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output);

-- n8_MUX_uxn_opcodes_h_l1242_c7_1957
n8_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- t8_MUX_uxn_opcodes_h_l1242_c7_1957
t8_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output);

-- n8_MUX_uxn_opcodes_h_l1245_c7_7e7a
n8_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- t8_MUX_uxn_opcodes_h_l1245_c7_7e7a
t8_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output);

-- n8_MUX_uxn_opcodes_h_l1249_c7_bee3
n8_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output);

-- n8_MUX_uxn_opcodes_h_l1252_c7_a8c1
n8_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27
BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left,
BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right,
BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419
BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left,
BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right,
BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output);

-- MUX_uxn_opcodes_h_l1256_c32_9357
MUX_uxn_opcodes_h_l1256_c32_9357 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1256_c32_9357_cond,
MUX_uxn_opcodes_h_l1256_c32_9357_iftrue,
MUX_uxn_opcodes_h_l1256_c32_9357_iffalse,
MUX_uxn_opcodes_h_l1256_c32_9357_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right,
BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2
BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output);

-- MUX_uxn_opcodes_h_l1262_c24_ea2d
MUX_uxn_opcodes_h_l1262_c24_ea2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1262_c24_ea2d_cond,
MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue,
MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse,
MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output,
 n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output,
 n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output,
 n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output,
 n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output,
 n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output,
 MUX_uxn_opcodes_h_l1256_c32_9357_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output,
 MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_73e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_25e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_fcd8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_19ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1256_c32_9357_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1256_c32_9357_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1261_c3_9b22 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1252_l1258_DUPLICATE_f240_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1232_l1269_DUPLICATE_7970_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_25e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_25e2;
     VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1261_c3_9b22 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1261_c3_9b22;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_19ad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1250_c3_19ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_fcd8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1247_c3_fcd8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_73e4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_73e4;
     VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iffalse := resize(to_signed(-1, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c6_85d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1264_c11_51e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_90a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1252_c11_23dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1258_c11_1fdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c24_f4c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_e14f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_865f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1252_l1258_DUPLICATE_f240 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1252_l1258_DUPLICATE_f240_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1256_c32_8b27] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_left;
     BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output := BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1256_c32_8b27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_85d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_865f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_90a1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e14f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1252_c11_23dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1258_c11_1fdb_return_output;
     VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c24_f4c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_51e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1242_l1236_l1252_l1249_l1245_DUPLICATE_76d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1242_l1264_l1258_l1252_l1249_l1245_DUPLICATE_ed81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1249_l1245_DUPLICATE_f144_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1242_l1252_l1245_l1249_DUPLICATE_2052_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1242_l1236_l1264_l1252_l1249_l1245_DUPLICATE_346c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1252_l1258_DUPLICATE_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1252_l1258_DUPLICATE_f240_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1242_l1236_l1258_l1252_l1249_l1245_DUPLICATE_f3aa_return_output;
     -- MUX[uxn_opcodes_h_l1262_c24_ea2d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1262_c24_ea2d_cond <= VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_cond;
     MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue <= VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iftrue;
     MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse <= VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output := MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1258_c7_b3e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1258_c7_b3e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1264_c7_11ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1256_c32_3419] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_left;
     BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output := BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1236_c1_cb93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1264_c7_11ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1256_c32_9357_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1256_c32_3419_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue := VAR_MUX_uxn_opcodes_h_l1262_c24_ea2d_return_output;
     VAR_printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_cb93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_11ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1258_c7_b3e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1258_c7_b3e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;

     -- printf_uxn_opcodes_h_l1237_c3_1810[uxn_opcodes_h_l1237_c3_1810] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1237_c3_1810_uxn_opcodes_h_l1237_c3_1810_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1258_c7_b3e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;

     -- MUX[uxn_opcodes_h_l1256_c32_9357] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1256_c32_9357_cond <= VAR_MUX_uxn_opcodes_h_l1256_c32_9357_cond;
     MUX_uxn_opcodes_h_l1256_c32_9357_iftrue <= VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iftrue;
     MUX_uxn_opcodes_h_l1256_c32_9357_iffalse <= VAR_MUX_uxn_opcodes_h_l1256_c32_9357_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1256_c32_9357_return_output := MUX_uxn_opcodes_h_l1256_c32_9357_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue := VAR_MUX_uxn_opcodes_h_l1256_c32_9357_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1258_c7_b3e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1252_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1252_c7_a8c1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;
     -- n8_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_bee3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c7_bee3_return_output;
     -- n8_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_7e7a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_7e7a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_1957] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_1957_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1236_c2_6faa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1232_l1269_DUPLICATE_7970 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1232_l1269_DUPLICATE_7970_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_6faa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1232_l1269_DUPLICATE_7970_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1232_l1269_DUPLICATE_7970_return_output;
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
