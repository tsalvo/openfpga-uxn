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
-- Submodules: 73
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2504_c6_d821]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2504_c1_2ed3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2504_c2_abc6]
signal n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2505_c3_61db[uxn_opcodes_h_l2505_c3_61db]
signal printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_b389]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2510_c7_31cb]
signal n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_407b]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_7b63]
signal n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_0940]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2517_c7_695b]
signal tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2517_c7_695b]
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2517_c7_695b]
signal n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_6bef]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2520_c7_a44f]
signal n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2524_c32_eb4f]
signal BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2524_c32_e056]
signal BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2524_c32_5b11]
signal MUX_uxn_opcodes_h_l2524_c32_5b11_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2524_c32_5b11_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_5317]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2526_c7_4307]
signal tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2526_c7_4307]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_4307]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_4307]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_4307]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2526_c7_4307]
signal result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2527_c18_4944]
signal BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2527_c11_f5bb]
signal BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2527_c34_735d]
signal CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2527_c11_4b4e]
signal BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_bdb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_24a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_24a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821
BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6
tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6
result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- t8_MUX_uxn_opcodes_h_l2504_c2_abc6
t8_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- n8_MUX_uxn_opcodes_h_l2504_c2_abc6
n8_MUX_uxn_opcodes_h_l2504_c2_abc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond,
n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue,
n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse,
n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

-- printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db
printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db : entity work.printf_uxn_opcodes_h_l2505_c3_61db_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb
tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- t8_MUX_uxn_opcodes_h_l2510_c7_31cb
t8_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- n8_MUX_uxn_opcodes_h_l2510_c7_31cb
n8_MUX_uxn_opcodes_h_l2510_c7_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond,
n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue,
n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse,
n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63
tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- t8_MUX_uxn_opcodes_h_l2513_c7_7b63
t8_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_7b63
n8_MUX_uxn_opcodes_h_l2513_c7_7b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2517_c7_695b
tmp8_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- n8_MUX_uxn_opcodes_h_l2517_c7_695b
n8_MUX_uxn_opcodes_h_l2517_c7_695b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond,
n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue,
n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse,
n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f
tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- n8_MUX_uxn_opcodes_h_l2520_c7_a44f
n8_MUX_uxn_opcodes_h_l2520_c7_a44f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond,
n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue,
n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse,
n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f
BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left,
BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right,
BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056
BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left,
BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right,
BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output);

-- MUX_uxn_opcodes_h_l2524_c32_5b11
MUX_uxn_opcodes_h_l2524_c32_5b11 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2524_c32_5b11_cond,
MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue,
MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse,
MUX_uxn_opcodes_h_l2524_c32_5b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2526_c7_4307
tmp8_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307
result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307
result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond,
result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944
BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left,
BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right,
BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb
BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left,
BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right,
BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2527_c34_735d
CONST_SR_4_uxn_opcodes_h_l2527_c34_735d : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x,
CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e
BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left,
BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right,
BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output,
 tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output,
 tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output,
 tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output,
 tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output,
 tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output,
 MUX_uxn_opcodes_h_l2524_c32_5b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output,
 tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output,
 CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_c063 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_df11 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_d719 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_7e0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_l2526_DUPLICATE_a95d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2538_l2500_DUPLICATE_1b8a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_df11 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_df11;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_c063 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_c063;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right := to_unsigned(15, 4);
     VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_7e0b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_7e0b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c7;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_d719 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_d719;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_0940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_bdb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_6bef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2524_c32_eb4f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_left;
     BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output := BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2527_c18_4944] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_left;
     BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output := BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_5317] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_l2526_DUPLICATE_a95d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_l2526_DUPLICATE_a95d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_b389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output := result.is_sp_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2527_c34_735d] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output := CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_407b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c6_d821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2524_c32_eb4f_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2527_c18_4944_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c6_d821_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_b389_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_407b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_0940_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_6bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_bdb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2504_DUPLICATE_bc70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2533_l2526_l2520_l2517_l2513_l2510_DUPLICATE_de39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2526_l2517_l2513_l2510_l2504_DUPLICATE_8e54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2517_l2510_l2520_l2513_DUPLICATE_9517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2533_l2520_l2517_l2513_l2510_l2504_DUPLICATE_a365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_l2526_DUPLICATE_a95d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_l2526_DUPLICATE_a95d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2526_l2520_l2517_l2513_l2510_l2504_DUPLICATE_e68c_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right := VAR_CONST_SR_4_uxn_opcodes_h_l2527_c34_735d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2524_c32_e056] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_left;
     BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output := BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_24a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_24a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2527_c11_f5bb] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_left;
     BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output := BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2504_c1_2ed3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2524_c32_e056_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2527_c11_f5bb_return_output;
     VAR_printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2504_c1_2ed3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_24a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- MUX[uxn_opcodes_h_l2524_c32_5b11] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2524_c32_5b11_cond <= VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_cond;
     MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue <= VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iftrue;
     MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse <= VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_return_output := MUX_uxn_opcodes_h_l2524_c32_5b11_return_output;

     -- printf_uxn_opcodes_h_l2505_c3_61db[uxn_opcodes_h_l2505_c3_61db] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2505_c3_61db_uxn_opcodes_h_l2505_c3_61db_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_SL[uxn_opcodes_h_l2527_c11_4b4e] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_left;
     BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output := BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2527_c11_4b4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue := VAR_MUX_uxn_opcodes_h_l2524_c32_5b11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     -- n8_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2526_c7_4307] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_cond;
     tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output := tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2526_c7_4307_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- n8_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2520_c7_a44f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2520_c7_a44f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- n8_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2517_c7_695b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_cond;
     tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output := tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2517_c7_695b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2513_c7_7b63] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output := result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2513_c7_7b63_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2510_c7_31cb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_cond;
     tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output := tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2510_c7_31cb_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2504_c2_abc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2538_l2500_DUPLICATE_1b8a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2538_l2500_DUPLICATE_1b8a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c2_abc6_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2538_l2500_DUPLICATE_1b8a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2538_l2500_DUPLICATE_1b8a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
