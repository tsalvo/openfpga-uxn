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
entity gth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_7c2e709f;
architecture arch of gth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2055_c6_0de1]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_2368]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2055_c2_0834]
signal t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2055_c2_0834]
signal n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c2_0834]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2056_c3_602b[uxn_opcodes_h_l2056_c3_602b]
signal printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_7dee]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_d35d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_2714]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_26bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_a31e]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_0d71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_d89c]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_9ef8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2075_c32_8d4b]
signal BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2075_c32_9372]
signal BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2075_c32_a068]
signal MUX_uxn_opcodes_h_l2075_c32_a068_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2075_c32_a068_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2075_c32_a068_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2075_c32_a068_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_52d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2077_c7_69f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_69f1]
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_69f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_69f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_69f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2081_c24_d2a1]
signal BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2081_c24_28cc]
signal MUX_uxn_opcodes_h_l2081_c24_28cc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2081_c24_28cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2083_c11_1ace]
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2083_c7_bc40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2083_c7_bc40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1
BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output);

-- t8_MUX_uxn_opcodes_h_l2055_c2_0834
t8_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- n8_MUX_uxn_opcodes_h_l2055_c2_0834
n8_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834
result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

-- printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b
printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b : entity work.printf_uxn_opcodes_h_l2056_c3_602b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output);

-- t8_MUX_uxn_opcodes_h_l2061_c7_d35d
t8_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- n8_MUX_uxn_opcodes_h_l2061_c7_d35d
n8_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d
result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output);

-- t8_MUX_uxn_opcodes_h_l2064_c7_26bc
t8_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- n8_MUX_uxn_opcodes_h_l2064_c7_26bc
n8_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc
result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc
result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc
result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output);

-- n8_MUX_uxn_opcodes_h_l2068_c7_0d71
n8_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71
result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71
result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output);

-- n8_MUX_uxn_opcodes_h_l2071_c7_9ef8
n8_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b
BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left,
BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right,
BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372
BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left,
BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right,
BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output);

-- MUX_uxn_opcodes_h_l2075_c32_a068
MUX_uxn_opcodes_h_l2075_c32_a068 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2075_c32_a068_cond,
MUX_uxn_opcodes_h_l2075_c32_a068_iftrue,
MUX_uxn_opcodes_h_l2075_c32_a068_iffalse,
MUX_uxn_opcodes_h_l2075_c32_a068_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1
BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left,
BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right,
BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output);

-- MUX_uxn_opcodes_h_l2081_c24_28cc
MUX_uxn_opcodes_h_l2081_c24_28cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2081_c24_28cc_cond,
MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue,
MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse,
MUX_uxn_opcodes_h_l2081_c24_28cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left,
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right,
BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40
result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40
result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output,
 t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output,
 t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output,
 t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output,
 n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output,
 n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output,
 MUX_uxn_opcodes_h_l2075_c32_a068_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output,
 MUX_uxn_opcodes_h_l2081_c24_28cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_5836 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2062_c3_855e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_168f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_1fbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2075_c32_a068_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2075_c32_a068_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2080_c3_b933 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2071_DUPLICATE_a71c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2088_l2051_DUPLICATE_94b1_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_5836 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2058_c3_5836;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2080_c3_b933 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2080_c3_b933;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2062_c3_855e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2062_c3_855e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_1fbd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_1fbd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_168f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_168f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_7dee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_a31e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_2714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l2075_c32_8d4b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_left;
     BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output := BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output := result.is_sp_shift;

     -- BIN_OP_GT[uxn_opcodes_h_l2081_c24_d2a1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_left;
     BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output := BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_52d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2071_DUPLICATE_a71c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2071_DUPLICATE_a71c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_d89c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c6_0de1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2083_c11_1ace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_left;
     BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output := BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2075_c32_8d4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c6_0de1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7dee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_2714_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_a31e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_d89c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_52d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2083_c11_1ace_return_output;
     VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2081_c24_d2a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2061_l2055_l2071_l2068_l2064_DUPLICATE_5a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2061_l2083_l2077_l2071_l2068_l2064_DUPLICATE_8de8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2068_l2064_DUPLICATE_f2d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2068_l2061_l2071_l2064_DUPLICATE_73ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2061_l2055_l2083_l2071_l2068_l2064_DUPLICATE_acaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2071_DUPLICATE_a71c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2071_DUPLICATE_a71c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2061_l2055_l2077_l2071_l2068_l2064_DUPLICATE_77b8_return_output;
     -- t8_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_69f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2083_c7_bc40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2055_c1_2368] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output;

     -- n8_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2075_c32_9372] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_left;
     BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output := BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2083_c7_bc40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2077_c7_69f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;

     -- MUX[uxn_opcodes_h_l2081_c24_28cc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2081_c24_28cc_cond <= VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_cond;
     MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue <= VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iftrue;
     MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse <= VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_return_output := MUX_uxn_opcodes_h_l2081_c24_28cc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2075_c32_a068_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2075_c32_9372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue := VAR_MUX_uxn_opcodes_h_l2081_c24_28cc_return_output;
     VAR_printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2055_c1_2368_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2083_c7_bc40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_69f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_69f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_69f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- MUX[uxn_opcodes_h_l2075_c32_a068] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2075_c32_a068_cond <= VAR_MUX_uxn_opcodes_h_l2075_c32_a068_cond;
     MUX_uxn_opcodes_h_l2075_c32_a068_iftrue <= VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iftrue;
     MUX_uxn_opcodes_h_l2075_c32_a068_iffalse <= VAR_MUX_uxn_opcodes_h_l2075_c32_a068_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2075_c32_a068_return_output := MUX_uxn_opcodes_h_l2075_c32_a068_return_output;

     -- t8_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- printf_uxn_opcodes_h_l2056_c3_602b[uxn_opcodes_h_l2056_c3_602b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2056_c3_602b_uxn_opcodes_h_l2056_c3_602b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue := VAR_MUX_uxn_opcodes_h_l2075_c32_a068_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_69f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- t8_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_9ef8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_9ef8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2068_c7_0d71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output := result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2068_c7_0d71_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2064_c7_26bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2064_c7_26bc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2061_c7_d35d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_d35d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c2_0834] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2088_l2051_DUPLICATE_94b1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2088_l2051_DUPLICATE_94b1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c2_0834_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c2_0834_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2088_l2051_DUPLICATE_94b1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2088_l2051_DUPLICATE_94b1_return_output;
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
