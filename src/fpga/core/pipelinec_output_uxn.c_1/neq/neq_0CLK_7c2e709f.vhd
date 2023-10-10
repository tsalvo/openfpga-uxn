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
-- BIN_OP_EQ[uxn_opcodes_h_l1393_c6_b95e]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1393_c1_3531]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1393_c2_a9ef]
signal n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1394_c3_d3a4[uxn_opcodes_h_l1394_c3_d3a4]
signal printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_cd87]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1399_c7_e2de]
signal n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_239e]
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1402_c7_db24]
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1402_c7_db24]
signal t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1402_c7_db24]
signal n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_d126]
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1406_c7_8edc]
signal n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1409_c11_de7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1409_c7_6426]
signal result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1409_c7_6426]
signal n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1413_c32_2b2c]
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1413_c32_c0a9]
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1413_c32_f88c]
signal MUX_uxn_opcodes_h_l1413_c32_f88c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f88c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e143]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_f2c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_f2c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_f2c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_f2c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1415_c7_f2c6]
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c24_d674]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1419_c24_003f]
signal MUX_uxn_opcodes_h_l1419_c24_003f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_003f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_003f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_003f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_3072]
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_325f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_325f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e
BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef
result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- t8_MUX_uxn_opcodes_h_l1393_c2_a9ef
t8_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- n8_MUX_uxn_opcodes_h_l1393_c2_a9ef
n8_MUX_uxn_opcodes_h_l1393_c2_a9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond,
n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue,
n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse,
n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

-- printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4
printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4 : entity work.printf_uxn_opcodes_h_l1394_c3_d3a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- t8_MUX_uxn_opcodes_h_l1399_c7_e2de
t8_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- n8_MUX_uxn_opcodes_h_l1399_c7_e2de
n8_MUX_uxn_opcodes_h_l1399_c7_e2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond,
n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue,
n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse,
n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24
result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- t8_MUX_uxn_opcodes_h_l1402_c7_db24
t8_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- n8_MUX_uxn_opcodes_h_l1402_c7_db24
n8_MUX_uxn_opcodes_h_l1402_c7_db24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond,
n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue,
n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse,
n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right,
BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc
result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- n8_MUX_uxn_opcodes_h_l1406_c7_8edc
n8_MUX_uxn_opcodes_h_l1406_c7_8edc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond,
n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue,
n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse,
n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d
BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426
result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426
result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426
result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426
result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426
result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426
result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- n8_MUX_uxn_opcodes_h_l1409_c7_6426
n8_MUX_uxn_opcodes_h_l1409_c7_6426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond,
n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue,
n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse,
n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c
BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left,
BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right,
BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9
BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left,
BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right,
BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output);

-- MUX_uxn_opcodes_h_l1413_c32_f88c
MUX_uxn_opcodes_h_l1413_c32_f88c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1413_c32_f88c_cond,
MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue,
MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse,
MUX_uxn_opcodes_h_l1413_c32_f88c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output);

-- MUX_uxn_opcodes_h_l1419_c24_003f
MUX_uxn_opcodes_h_l1419_c24_003f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1419_c24_003f_cond,
MUX_uxn_opcodes_h_l1419_c24_003f_iftrue,
MUX_uxn_opcodes_h_l1419_c24_003f_iffalse,
MUX_uxn_opcodes_h_l1419_c24_003f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output,
 MUX_uxn_opcodes_h_l1413_c32_f88c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output,
 MUX_uxn_opcodes_h_l1419_c24_003f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_7f9f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_542f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3b1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_cf34 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_68b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_003f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_003f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1409_DUPLICATE_47a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1389_l1426_DUPLICATE_c19c_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_7f9f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1396_c3_7f9f;
     VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_cf34 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_cf34;
     VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_68b1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_68b1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_542f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_542f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3b1f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3b1f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1409_DUPLICATE_47a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1409_DUPLICATE_47a6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1409_c11_de7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c6_b95e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1406_c11_d126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_left;
     BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output := BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l1413_c32_2b2c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_left;
     BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output := BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_3072] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_left;
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output := BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_cd87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_239e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e143] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c24_d674] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_2b2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c6_b95e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_cd87_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_239e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1406_c11_d126_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1409_c11_de7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e143_return_output;
     VAR_MUX_uxn_opcodes_h_l1419_c24_003f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_d674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_3072_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1409_l1406_l1402_l1399_DUPLICATE_5b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1421_l1415_l1409_l1406_l1402_l1399_DUPLICATE_1f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1415_l1406_l1402_l1399_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1402_l1406_l1399_l1409_DUPLICATE_8f5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1421_l1409_l1406_l1402_l1399_DUPLICATE_3362_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1409_DUPLICATE_47a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1409_DUPLICATE_47a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1415_l1409_l1406_l1402_l1399_DUPLICATE_a13e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_f2c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;

     -- MUX[uxn_opcodes_h_l1419_c24_003f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1419_c24_003f_cond <= VAR_MUX_uxn_opcodes_h_l1419_c24_003f_cond;
     MUX_uxn_opcodes_h_l1419_c24_003f_iftrue <= VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iftrue;
     MUX_uxn_opcodes_h_l1419_c24_003f_iffalse <= VAR_MUX_uxn_opcodes_h_l1419_c24_003f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1419_c24_003f_return_output := MUX_uxn_opcodes_h_l1419_c24_003f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_f2c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1393_c1_3531] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1413_c32_c0a9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_left;
     BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output := BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_325f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_325f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_c0a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue := VAR_MUX_uxn_opcodes_h_l1419_c24_003f_return_output;
     VAR_printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1393_c1_3531_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_325f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_325f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     -- t8_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_f2c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_f2c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;

     -- printf_uxn_opcodes_h_l1394_c3_d3a4[uxn_opcodes_h_l1394_c3_d3a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1394_c3_d3a4_uxn_opcodes_h_l1394_c3_d3a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- n8_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1415_c7_f2c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;

     -- MUX[uxn_opcodes_h_l1413_c32_f88c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1413_c32_f88c_cond <= VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_cond;
     MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue <= VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iftrue;
     MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse <= VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_return_output := MUX_uxn_opcodes_h_l1413_c32_f88c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue := VAR_MUX_uxn_opcodes_h_l1413_c32_f88c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_f2c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- n8_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- t8_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1409_c7_6426] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output := result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1409_c7_6426_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1406_c7_8edc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;

     -- n8_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1406_c7_8edc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- n8_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c7_db24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_db24_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_e2de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_e2de_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1393_c2_a9ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1389_l1426_DUPLICATE_c19c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1389_l1426_DUPLICATE_c19c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c2_a9ef_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1389_l1426_DUPLICATE_c19c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1389_l1426_DUPLICATE_c19c_return_output;
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
