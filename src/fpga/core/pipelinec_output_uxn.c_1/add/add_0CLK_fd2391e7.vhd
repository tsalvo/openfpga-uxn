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
entity add_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_fd2391e7;
architecture arch of add_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l736_c6_51c2]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l736_c1_cecb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l736_c2_a13f]
signal n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l736_c2_a13f]
signal t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c2_a13f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l737_c3_1d01[uxn_opcodes_h_l737_c3_1d01]
signal printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l742_c11_ab30]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l742_c7_e73c]
signal n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l742_c7_e73c]
signal t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_e73c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l745_c11_f5f6]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l745_c7_ad90]
signal n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l745_c7_ad90]
signal t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_ad90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_0043]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_b0b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l752_c11_8f11]
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l752_c7_3730]
signal n8_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l752_c7_3730]
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l756_c32_33ea]
signal BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l756_c32_0728]
signal BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l756_c32_d8cb]
signal MUX_uxn_opcodes_h_l756_c32_d8cb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l756_c32_d8cb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_0cd9]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l758_c7_6da8]
signal result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_6da8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_6da8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_6da8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_6da8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l762_c24_bcc1]
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l764_c11_2e2c]
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l764_c7_2069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_2069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2
BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output);

-- n8_MUX_uxn_opcodes_h_l736_c2_a13f
n8_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- t8_MUX_uxn_opcodes_h_l736_c2_a13f
t8_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f
result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f
result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f
result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f
result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

-- printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01
printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01 : entity work.printf_uxn_opcodes_h_l737_c3_1d01_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30
BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output);

-- n8_MUX_uxn_opcodes_h_l742_c7_e73c
n8_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- t8_MUX_uxn_opcodes_h_l742_c7_e73c
t8_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c
result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6
BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output);

-- n8_MUX_uxn_opcodes_h_l745_c7_ad90
n8_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- t8_MUX_uxn_opcodes_h_l745_c7_ad90
t8_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043
BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output);

-- n8_MUX_uxn_opcodes_h_l749_c7_b0b7
n8_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7
result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11
BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left,
BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right,
BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output);

-- n8_MUX_uxn_opcodes_h_l752_c7_3730
n8_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l752_c7_3730_cond,
n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730
result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea
BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left,
BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right,
BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l756_c32_0728
BIN_OP_GT_uxn_opcodes_h_l756_c32_0728 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left,
BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right,
BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output);

-- MUX_uxn_opcodes_h_l756_c32_d8cb
MUX_uxn_opcodes_h_l756_c32_d8cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l756_c32_d8cb_cond,
MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue,
MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse,
MUX_uxn_opcodes_h_l756_c32_d8cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9
BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8
result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond,
result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1
BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left,
BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right,
BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c
BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069
result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output,
 n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output,
 n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output,
 n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output,
 n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output,
 n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output,
 BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output,
 BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output,
 MUX_uxn_opcodes_h_l756_c32_d8cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_af72 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_ab9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_c39a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_0733 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l762_c3_a491 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l761_c3_db7e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l752_l758_DUPLICATE_3670_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l769_l732_DUPLICATE_a8ec_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_ab9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_ab9d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_af72 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_af72;
     VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_0733 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_0733;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_c39a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_c39a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l761_c3_db7e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l761_c3_db7e;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_0cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c6_51c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l752_l758_DUPLICATE_3670 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l752_l758_DUPLICATE_3670_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l756_c32_33ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_left;
     BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output := BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_0043] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c11_ab30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l745_c11_f5f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l764_c11_2e2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l752_c11_8f11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_left;
     BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output := BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l762_c24_bcc1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left := VAR_BIN_OP_AND_uxn_opcodes_h_l756_c32_33ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c6_51c2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_ab30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_f5f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_0043_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_8f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_0cd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_2e2c_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l762_c3_a491 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c24_bcc1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l736_l752_l742_l745_DUPLICATE_d0d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l749_l752_l758_l742_l764_l745_DUPLICATE_59fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l736_l758_l742_l745_DUPLICATE_70c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l745_l752_l742_DUPLICATE_818d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l749_l736_l752_l742_l764_l745_DUPLICATE_4f4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l752_l758_DUPLICATE_3670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l752_l758_DUPLICATE_3670_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l736_l752_l758_l742_l745_DUPLICATE_0731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue := VAR_result_stack_value_uxn_opcodes_h_l762_c3_a491;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l736_c1_cecb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l756_c32_0728] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_left;
     BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output := BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l764_c7_2069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- t8_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- n8_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output := n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_6da8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l758_c7_6da8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output := result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_6da8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_2069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l756_c32_0728_return_output;
     VAR_printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l736_c1_cecb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_2069_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c7_2069_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- n8_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_6da8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_6da8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;

     -- t8_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- MUX[uxn_opcodes_h_l756_c32_d8cb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l756_c32_d8cb_cond <= VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_cond;
     MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue <= VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iftrue;
     MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse <= VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_return_output := MUX_uxn_opcodes_h_l756_c32_d8cb_return_output;

     -- printf_uxn_opcodes_h_l737_c3_1d01[uxn_opcodes_h_l737_c3_1d01] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l737_c3_1d01_uxn_opcodes_h_l737_c3_1d01_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue := VAR_MUX_uxn_opcodes_h_l756_c32_d8cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_n8_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_6da8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l752_c7_3730] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output;

     -- t8_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- n8_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_3730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- n8_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_b0b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_b0b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- n8_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_ad90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ad90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_e73c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_e73c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c2_a13f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l769_l732_DUPLICATE_a8ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l769_l732_DUPLICATE_a8ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l736_c2_a13f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c2_a13f_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l769_l732_DUPLICATE_a8ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l769_l732_DUPLICATE_a8ec_return_output;
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
