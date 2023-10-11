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
-- Submodules: 60
entity gth_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_1c7b7172;
architecture arch of gth_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_a4f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1955_c1_903d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1955_c2_28de]
signal n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1955_c2_28de]
signal t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_28de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1956_c3_5ed5[uxn_opcodes_h_l1956_c3_5ed5]
signal printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_9472]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_13fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_42dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_5e03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_7a71]
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1967_c7_540b]
signal n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_540b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_a059]
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1970_c7_2203]
signal n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_2203]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1973_c32_96de]
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1973_c32_edf2]
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1973_c32_af4b]
signal MUX_uxn_opcodes_h_l1973_c32_af4b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_af4b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_bcdf]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_9200]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_9200]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_9200]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_9200]
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_9200]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1979_c24_1ed1]
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1979_c24_c356]
signal MUX_uxn_opcodes_h_l1979_c24_c356_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_c356_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_c356_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c24_c356_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_d255]
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_dc4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_dc4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output);

-- n8_MUX_uxn_opcodes_h_l1955_c2_28de
n8_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- t8_MUX_uxn_opcodes_h_l1955_c2_28de
t8_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

-- printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5
printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5 : entity work.printf_uxn_opcodes_h_l1956_c3_5ed5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output);

-- n8_MUX_uxn_opcodes_h_l1960_c7_13fd
n8_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- t8_MUX_uxn_opcodes_h_l1960_c7_13fd
t8_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output);

-- n8_MUX_uxn_opcodes_h_l1963_c7_5e03
n8_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- t8_MUX_uxn_opcodes_h_l1963_c7_5e03
t8_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output);

-- n8_MUX_uxn_opcodes_h_l1967_c7_540b
n8_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output);

-- n8_MUX_uxn_opcodes_h_l1970_c7_2203
n8_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de
BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2
BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output);

-- MUX_uxn_opcodes_h_l1973_c32_af4b
MUX_uxn_opcodes_h_l1973_c32_af4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1973_c32_af4b_cond,
MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue,
MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse,
MUX_uxn_opcodes_h_l1973_c32_af4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1
BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left,
BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right,
BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output);

-- MUX_uxn_opcodes_h_l1979_c24_c356
MUX_uxn_opcodes_h_l1979_c24_c356 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1979_c24_c356_cond,
MUX_uxn_opcodes_h_l1979_c24_c356_iftrue,
MUX_uxn_opcodes_h_l1979_c24_c356_iffalse,
MUX_uxn_opcodes_h_l1979_c24_c356_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output,
 n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output,
 n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output,
 n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output,
 n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output,
 n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output,
 MUX_uxn_opcodes_h_l1973_c32_af4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output,
 MUX_uxn_opcodes_h_l1979_c24_c356_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9880 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_9e82 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_61d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_c4a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_8744 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_c356_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c24_c356_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_82bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1986_l1951_DUPLICATE_c66d_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9880 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_9880;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_61d7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_61d7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_c4a3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_c4a3;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_8744 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_8744;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_9e82 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_9e82;
     VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_9472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_a059] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_left;
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output := BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1973_c32_96de] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_left;
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output := BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_bcdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1979_c24_1ed1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_left;
     BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output := BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_d255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_left;
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output := BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_a4f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_7a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_42dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_82bf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_82bf_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_96de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_a4f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_9472_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_42dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_7a71_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_a059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_bcdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_d255_return_output;
     VAR_MUX_uxn_opcodes_h_l1979_c24_c356_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c24_1ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_DUPLICATE_786f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1981_l1975_DUPLICATE_e6b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1967_l1963_l1960_l1955_l1975_DUPLICATE_f108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1981_DUPLICATE_a62d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_82bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1970_l1975_DUPLICATE_82bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1970_l1967_l1963_l1960_l1955_l1975_DUPLICATE_e881_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_dc4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output;

     -- MUX[uxn_opcodes_h_l1979_c24_c356] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1979_c24_c356_cond <= VAR_MUX_uxn_opcodes_h_l1979_c24_c356_cond;
     MUX_uxn_opcodes_h_l1979_c24_c356_iftrue <= VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iftrue;
     MUX_uxn_opcodes_h_l1979_c24_c356_iffalse <= VAR_MUX_uxn_opcodes_h_l1979_c24_c356_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1979_c24_c356_return_output := MUX_uxn_opcodes_h_l1979_c24_c356_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1955_c1_903d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_9200] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1973_c32_edf2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_left;
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output := BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_9200] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_dc4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_edf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue := VAR_MUX_uxn_opcodes_h_l1979_c24_c356_return_output;
     VAR_printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1955_c1_903d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_dc4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_9200] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- MUX[uxn_opcodes_h_l1973_c32_af4b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1973_c32_af4b_cond <= VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_cond;
     MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue <= VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iftrue;
     MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse <= VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_return_output := MUX_uxn_opcodes_h_l1973_c32_af4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_9200] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_9200] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output := result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;

     -- n8_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- printf_uxn_opcodes_h_l1956_c3_5ed5[uxn_opcodes_h_l1956_c3_5ed5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1956_c3_5ed5_uxn_opcodes_h_l1956_c3_5ed5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue := VAR_MUX_uxn_opcodes_h_l1973_c32_af4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_9200_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- n8_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- t8_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_2203] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1970_c7_2203_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_540b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_540b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_5e03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- n8_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1963_c7_5e03_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_13fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1960_c7_13fd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_28de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1986_l1951_DUPLICATE_c66d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1986_l1951_DUPLICATE_c66d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1955_c2_28de_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_28de_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1986_l1951_DUPLICATE_c66d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1986_l1951_DUPLICATE_c66d_return_output;
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
