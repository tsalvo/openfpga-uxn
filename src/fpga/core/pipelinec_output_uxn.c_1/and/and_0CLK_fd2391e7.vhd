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
-- Submodules: 64
entity and_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_fd2391e7;
architecture arch of and_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l837_c6_fc00]
signal BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l837_c1_cc93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l837_c2_e260]
signal n8_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l837_c2_e260]
signal t8_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l837_c2_e260]
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l838_c3_4052[uxn_opcodes_h_l838_c3_4052]
signal printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_2016]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l843_c7_60b2]
signal n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l843_c7_60b2]
signal t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_60b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_b293]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l846_c7_4e29]
signal n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l846_c7_4e29]
signal t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_4e29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l850_c11_f113]
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l850_c7_a999]
signal n8_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l850_c7_a999]
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l853_c11_c8e0]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l853_c7_fd19]
signal n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c7_fd19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l857_c32_6f5d]
signal BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l857_c32_8d6f]
signal BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l857_c32_41a4]
signal MUX_uxn_opcodes_h_l857_c32_41a4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l857_c32_41a4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l857_c32_41a4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l857_c32_41a4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l859_c11_3f25]
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l859_c7_f6b1]
signal result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l859_c7_f6b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l859_c7_f6b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l859_c7_f6b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l859_c7_f6b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l863_c24_f006]
signal BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_9cbb]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_5d3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_5d3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00
BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left,
BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right,
BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output);

-- n8_MUX_uxn_opcodes_h_l837_c2_e260
n8_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l837_c2_e260_cond,
n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- t8_MUX_uxn_opcodes_h_l837_c2_e260
t8_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l837_c2_e260_cond,
t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260
result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260
result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260
result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260
result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260
result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

-- printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052
printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052 : entity work.printf_uxn_opcodes_h_l838_c3_4052_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016
BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output);

-- n8_MUX_uxn_opcodes_h_l843_c7_60b2
n8_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- t8_MUX_uxn_opcodes_h_l843_c7_60b2
t8_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2
result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293
BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output);

-- n8_MUX_uxn_opcodes_h_l846_c7_4e29
n8_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- t8_MUX_uxn_opcodes_h_l846_c7_4e29
t8_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113
BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left,
BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right,
BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output);

-- n8_MUX_uxn_opcodes_h_l850_c7_a999
n8_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l850_c7_a999_cond,
n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999
result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output);

-- n8_MUX_uxn_opcodes_h_l853_c7_fd19
n8_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19
result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d
BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left,
BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right,
BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f
BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left,
BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right,
BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output);

-- MUX_uxn_opcodes_h_l857_c32_41a4
MUX_uxn_opcodes_h_l857_c32_41a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l857_c32_41a4_cond,
MUX_uxn_opcodes_h_l857_c32_41a4_iftrue,
MUX_uxn_opcodes_h_l857_c32_41a4_iffalse,
MUX_uxn_opcodes_h_l857_c32_41a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25
BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left,
BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right,
BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1
result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l863_c24_f006
BIN_OP_AND_uxn_opcodes_h_l863_c24_f006 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left,
BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right,
BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb
BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output,
 n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output,
 n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output,
 n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output,
 n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output,
 n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output,
 BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output,
 MUX_uxn_opcodes_h_l857_c32_41a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_225d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_0f3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_3af6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_30e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l857_c32_41a4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l857_c32_41a4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_ea5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l859_l853_DUPLICATE_ac8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l870_l833_DUPLICATE_50ea_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_30e0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_30e0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_3af6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l848_c3_3af6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_225d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_225d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_ea5d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l862_c3_ea5d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_0f3e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l844_c3_0f3e;
     VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l853_c11_c8e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l837_c6_fc00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_left;
     BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output := BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_2016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l857_c32_6f5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_left;
     BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output := BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l859_c11_3f25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_left;
     BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output := BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_b293] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l850_c11_f113] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_left;
     BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output := BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_9cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l859_l853_DUPLICATE_ac8c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l859_l853_DUPLICATE_ac8c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l863_c24_f006] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_left;
     BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output := BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l857_c32_6f5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l863_c24_f006_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c6_fc00_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_2016_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_b293_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l850_c11_f113_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c11_c8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l859_c11_3f25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_9cbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_DUPLICATE_e2ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l865_DUPLICATE_9f9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l859_l846_l843_l850_l837_DUPLICATE_0bbc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l843_l850_l846_l853_DUPLICATE_0132_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l846_l853_l843_l850_l837_l865_DUPLICATE_9b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l859_l853_DUPLICATE_ac8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l859_l853_DUPLICATE_ac8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l859_l846_l853_l843_l850_l837_DUPLICATE_5f9f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_5d3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l857_c32_8d6f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_left;
     BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output := BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l837_c1_cc93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_5d3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- t8_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l859_c7_f6b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l859_c7_f6b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;

     -- n8_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l859_c7_f6b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l857_c32_41a4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l857_c32_8d6f_return_output;
     VAR_printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l837_c1_cc93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_n8_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_5d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     -- MUX[uxn_opcodes_h_l857_c32_41a4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l857_c32_41a4_cond <= VAR_MUX_uxn_opcodes_h_l857_c32_41a4_cond;
     MUX_uxn_opcodes_h_l857_c32_41a4_iftrue <= VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iftrue;
     MUX_uxn_opcodes_h_l857_c32_41a4_iffalse <= VAR_MUX_uxn_opcodes_h_l857_c32_41a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l857_c32_41a4_return_output := MUX_uxn_opcodes_h_l857_c32_41a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l859_c7_f6b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- printf_uxn_opcodes_h_l838_c3_4052[uxn_opcodes_h_l838_c3_4052] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l838_c3_4052_uxn_opcodes_h_l838_c3_4052_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- n8_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output := n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l859_c7_f6b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- t8_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue := VAR_MUX_uxn_opcodes_h_l857_c32_41a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_n8_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l859_c7_f6b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_t8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     -- t8_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output := t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- n8_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c7_fd19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c7_fd19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l837_c2_e260_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- n8_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l850_c7_a999] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_n8_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l850_c7_a999_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_4e29] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;

     -- n8_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output := n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l837_c2_e260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_4e29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_60b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l843_c7_60b2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l837_c2_e260] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l870_l833_DUPLICATE_50ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l870_l833_DUPLICATE_50ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c2_e260_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c2_e260_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l870_l833_DUPLICATE_50ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l870_l833_DUPLICATE_50ea_return_output;
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
